# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.8.0.tar.gz"
  sha256 "2cf95009ee9b70e46f92ea6346d4f615df2c163b27182ec0e62bf67fb9f9544c"
  license "GPL-3.0"
  version "1.8.0"

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
      ENV["VERSION"] = "v1.8.0"
      ENV["COMMIT"] = "71385e9f4e91ab982076856cac95320173ccea73"
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
