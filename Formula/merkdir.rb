# frozen_string_literal: true

class Merkdir < Formula
  desc "Create Merkle trees from your directories."
  homepage "https://github.com/makew0rld/merkdir"
  url "https://github.com/makew0rld/merkdir/archive/v1.0.1.tar.gz"
  sha256 "41ee65664ebd39bade084874c29c4a39537b7a6dac23ec467d5d19b7d9676150"
  license "GPL-3.0"
  version "1.0.1"

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
      system "#{HOMEBREW_PREFIX}/bin/just", "builtby=homebrew-tap", "version=v1.0.1", "commit=37d27185a419ab63451b36d3b0514165d81d70c5", "date=unknown"
    end
    bin.install "merkdir"
  end
  
end
