# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.5.0.tar.gz"
  sha256 "c8478b00155ad74712b957444b7afe025a74030907b77cca0903b6477f79843d"
  license "GPL-3.0"
  version "1.5.0"

  depends_on "go" => :build

  def install
    # Install new Makefile
    system "curl", "-sSL", "https://github.com/makeworld-the-better-one/amfora/raw/b2b8e30/Makefile"
    ENV["GO111MODULE"] = "on"
    ENV["VERSION"] = "v1.5.0"
    ENV["COMMIT"] = "922e7981a92cb7bf0d7b3baf1694d0fffe90d448"
    ENV["BUILDER"] = "official-brew-tap"
    system "make"
    bin.install "amfora"
  end

  test do
    system "#{bin}/amfora", "-v"
  end
end
