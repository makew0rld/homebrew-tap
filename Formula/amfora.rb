# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.5.0.tar.gz"
  sha256 "c8478b00155ad74712b957444b7afe025a74030907b77cca0903b6477f79843d"
  license "GPL-3.0"
  version "1.5.0"

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
    else
        # Install actual Makefile, not included in v1.5.0 source
    	system "curl", "-sSL", "https://github.com/makeworld-the-better-one/amfora/raw/3cb15cb/Makefile", "-o", "Makefile"
        ENV["VERSION"] = "v1.5.0"
        ENV["COMMIT"] = "922e7981a92cb7bf0d7b3baf1694d0fffe90d448"
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
    assert_match /Amfora v#{version}\nCommit: .*\nBuilt by: official-brew-tap/, shell_output("#{bin}/amfora -v").chomp
  end
end
