# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.5.0.tar.gz"
  sha256 "c8478b00155ad74712b957444b7afe025a74030907b77cca0903b6477f79843d"
  license "GPL-3.0"
  version "1.5.0"

  head do
    url "https://github.com/makeworld-the-better-one/amfora.git"
  end

  depends_on "go" => :build

  def install
    ENV["GO111MODULE"] = "on"
    ENV["CGO_ENABLED"] = "0"
    system "go", "mod", "download"
    system "go", "build", "-o", "bin/amfora", "-ldflags=\"-s -w -X main.version=1.5.0 -X main.commit=922e7981a92cb7bf0d7b3baf1694d0fffe90d448 -X main.builtBy=official-brew-tap\""
    bin.install "bin/amfora"
  end
end
