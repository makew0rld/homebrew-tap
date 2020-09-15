# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora.git"
  sha256 "c8478b00155ad74712b957444b7afe025a74030907b77cca0903b6477f79843d"
  license "GPL-3.0"
  version "1.5.0"

  depends_on "go" => :build

  def install
    ENV["GO111MODULE"] = "on"
    git checkout b2b8e30
    system "PREFIX=.", "BUILDER=official-brew-tap", "make"
    bin.install bin/amfora
  end

  test do
    system "#{bin}/amfora", "-v"
  end
end
