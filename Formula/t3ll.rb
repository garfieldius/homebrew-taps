# Generated on 2023.08.17 11:00:34
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.3.tar.gz"
  sha256 "56989b08e76ed9e2c1eac1ccfc0f947bdc9e5ea0c910e59df4cf89d0f45c6d97"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.3/"
    sha256 arm64_big_sur: "3d448d76bd642e3b75fae9c409fe136bd3231a5dd93764f4fdbef0232117e5f1"
    sha256 sierra:   "ff42862ec24cec0028c170e5fa38580c3372e4e1376da08b022900ba5fc68a86"
    sha256 x86_64_linux:  "bda02a1d4e5ab9fde47a943b976bd683d7f3cfe35119e81ab802199415cc31f0"
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
