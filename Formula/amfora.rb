# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.7.2.tar.gz"
  sha256 "3eb436a81b11b4db75dfb94e38eeaed994ce48a6a5f75ae02efd3f59cc76ec3e"
  license "GPL-3.0"
  version "1.7.2"

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
      ENV["VERSION"] = "v1.7.2"
      ENV["COMMIT"] = "6e3e8a0584c006d2b4f082387c2361f3a6b0645f"
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
