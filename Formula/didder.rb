# frozen_string_literal: true

class Didder < Formula
  desc "An extensive, fast, and accurate command-line image dithering tool."
  homepage "https://github.com/makew0rld/didder"
  url "https://github.com/makew0rld/didder/archive/v1.3.0.tar.gz"
  sha256 "6c9124eb5aa5b432065dc81d164055d94940aac3a8f14c8fb9e2f17027bd5901"
  license "GPL-3.0"
  version "1.3.0"

  depends_on "go" => :build
  depends_on "make" => :build

  head do
    url 'https://github.com/makew0rld/didder.git', :branch => "main"
  end

  def applications
    share / 'applications'
  end

  def install
    if build.head?
      system "git", "fetch", "--tags"
      system "git", "fetch", "--unshallow"
    else
      ENV["VERSION"] = "v1.3.0"
      ENV["COMMIT"] = "409cfa6ce70d15a9c70ce3783e0d362e1cafdf4e"
    end

    ENV["GO111MODULE"] = "on"
    ENV["BUILDER"] = "official-brew-tap"
    system "#{HOMEBREW_PREFIX}/bin/gmake"
    bin.install "didder"
    man1.install "didder.1"

  end

end
