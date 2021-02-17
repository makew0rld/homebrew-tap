# frozen_string_literal: true

class Amfora < Formula
  desc "A fancy terminal browser for the Gemini protocol."
  homepage "https://github.com/makeworld-the-better-one/amfora"
  url "https://github.com/makeworld-the-better-one/amfora/archive/v1.8.0.tar.gz"
  sha256 "02249da218db33155dc96f8de71c768484d8f110a5a5cc1f0a801d09604c7624"
  license "GPL-3.0"
  version "1.8.0"

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
      system "git", "fetch", "--unshallow"
    else
      ENV["VERSION"] = "v1.8.0"
      ENV["COMMIT"] = "0025742ff51a864ca91eb2ae3a897f05a5ddbb53"
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
    assert_match /Amfora v.*\nCommit: .*\nBuilt by: official-brew-tap/, shell_output("#{bin}/amfora -v").chomp
  end
end
