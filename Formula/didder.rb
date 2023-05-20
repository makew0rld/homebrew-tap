# frozen_string_literal: true

class Didder < Formula
  desc "An extensive, fast, and accurate command-line image dithering tool."
  homepage "https://github.com/makew0rld/didder"
  url "https://github.com/makew0rld/didder/archive/v1.1.0.tar.gz"
  sha256 "a850ae54125ed2aa1be54b1cc11481c00094d346861bd59014d621dc48f9aed6"
  license "GPL-3.0"
  version "1.1.0"

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
      ENV["VERSION"] = "v1.1.0"
      ENV["COMMIT"] = "9eb5bf257af601be80a7499ce4731476d226b3fc"
    end

    ENV["GO111MODULE"] = "on"
    ENV["BUILDER"] = "official-brew-tap"
    system "#{HOMEBREW_PREFIX}/bin/gmake"
    bin.install "didder"
    man1.install "didder.1"

  end

end
