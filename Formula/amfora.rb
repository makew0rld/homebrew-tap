# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.6.0.tar.gz"
  sha256 "a02b070679718953a4184ef2b7fbeccfcdf9bf227ca1efab34ee0d7fa21e9bd9"
  license "GPL-3.0"
  version "1.6.0"

  depends_on "go" => :build
  depends_on "make" => :build

  head do
    url 'https://github.com/makeworld-the-better-one/amfora.git'
  end

  def install

    def applications
        share / 'applications'
    end

    if build.head?
      system "git", "fetch", "--tags"
      system "git", "fetch", "--unshallow"
    else
      ENV["VERSION"] = "v1.6.0"
      ENV["COMMIT"] = "445be96e467a959aff6dc8aaf75ca8751ce6f2d7"
    end

    ENV["GO111MODULE"] = "on"
    ENV["BUILDER"] = "official-brew-tap"
    system "#{HOMEBREW_PREFIX}/bin/gmake"
    bin.install "amfora"

    if not OS.mac?
        applications.install amfora.desktop
    end
  end

  test do
    assert_match /Amfora v.*\nCommit: .*\nBuilt by: official-brew-tap/, shell_output("#{bin}/amfora -v").chomp
  end
end
