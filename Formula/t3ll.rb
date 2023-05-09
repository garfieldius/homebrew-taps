# Generated on 2023.05.09 15:01:00
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.1.tar.gz"
  sha256 "cea3408339cd9a9aa4c3b1dd6f87f30c58e4e0ac72cba755bef34584cea45c33"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.1/"
    sha256 arm64_big_sur: "add67e06e4df6afad9cc8e0b5d243d4973a013c1d7e5f21bcb248bbf6591804a"
    sha256 sierra:   "33cc2a3686b0defa860ebb1e578339fed9fb1da68296bbca2f88eec7b04a3cc5"
    sha256 x86_64_linux:  "2cde8fa92851f495be4724415d7b3f72e134fdac756a0cbc33535cca16f88a76"
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
