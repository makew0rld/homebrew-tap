# frozen_string_literal: true

class Merkdir < Formula
  desc "Create Merkle trees from your directories."
  homepage "https://github.com/makew0rld/merkdir"
  url "https://github.com/makew0rld/merkdir/archive/v1.0.0.tar.gz"
  sha256 "382da73c97f5284489a6a9337d8ea30505808b595de9d510a3c154529c16a226"
  license "GPL-3.0"
  version "1.0.0"

  depends_on "go" => :build
  depends_on "just" => :build

  head do
    url 'https://github.com/makew0rld/merkdir.git', :branch => "main"
  end

  def install
    if build.head?
      system "git", "fetch", "--tags"
      system "git", "fetch", "--unshallow"
      system "#{HOMEBREW_PREFIX}/bin/just", "builtby=homebrew-tap" 
    else
      system "#{HOMEBREW_PREFIX}/bin/just", "builtby=homebrew-tap", "version=v1.0.0", "commit=a959087452d780b6412458df402b4b72a6739974", "date=unknown"
    end
    bin.install "merkdir"
  end
  
end
