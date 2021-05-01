# frozen_string_literal: true

class Didder < Formula
  desc "An extensive, fast, and accurate command-line image dithering tool."
  homepage "https://github.com/makeworld-the-better-one/didder"
  url "https://github.com/makeworld-the-better-one/didder/archive/v1.0.0.tar.gz"
  sha256 "b1329690f0041ac9a84b48527859f8138196ea8bf2d12e36b93ea57475e1671c"
  license "GPL-3.0"
  version "1.0.0"

  depends_on "go" => :build
  depends_on "make" => :build

  head do
    url 'https://github.com/makeworld-the-better-one/didder.git'
  end

  def install

    def applications
        share / 'applications'
    end

    if build.head?
      system "git", "fetch", "--tags"
      system "git", "fetch", "--unshallow"
    else
      ENV["VERSION"] = "v1.0.0"
      ENV["COMMIT"] = "dcc08250d2c06832152d8f9b866285e4249700de"
    end

    ENV["GO111MODULE"] = "on"
    ENV["BUILDER"] = "official-brew-tap"
    system "#{HOMEBREW_PREFIX}/bin/gmake"
    bin.install "didder"

  end

end
