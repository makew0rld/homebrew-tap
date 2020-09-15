# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/b2b8e30.tar.gz"
  sha256 "d14ef4e5f13f92a209a1d2f9f9a5ccb443d8d27e06fbfa7ea880658cffe015e7"
  license "GPL-3.0"
  version "1.5.0"

  depends_on "go" => :build

  def install
    ENV["GO111MODULE"] = "on"
    ENV["PREFIX"] = "."
    ENV["BUILDER"] = "official-brew-tap"
    system "make"
    bin.install "amfora"
  end

  test do
    system "#{bin}/amfora", "-v"
  end
end
