# Generated on 2025.01.07 14:46:07
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.7.tar.gz"
  sha256 "188b45a3b17ac85b9cabb07137bf3fbdc2bd555f39968180f3f815f0e32f5743"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.7/"
    sha256 arm64_big_sur: "5ccd0c79ca6c5e91372ae3cb103e61750d1da0f9ee9a6cc38d91bf00414d12a8"
    sha256 sierra:   "4c2f65f443df8cda79cf862767a8e4ee6aae87fdb02d654184a7ca1a02bfd7be"
    sha256 x86_64_linux:  "332752552f8a7267e8ed5fc2b81ebad3f4956d3f671a4d9d823d8cb2a93f0db3"
  end

  depends_on "go"   => :build
  depends_on "make" => :build
  depends_on "node" => :build
  depends_on "yarn" => :build

  def install
    system "make", "VERSION=v#{version}"
    mkdir_p bin.to_s
    cp "t3ll", bin.to_s
  end

  test do
    system "#{bin}/t3ll", "version"
  end
end
