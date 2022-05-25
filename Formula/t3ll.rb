# Generated on 2022.05.25 17:20:38
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.6.tar.gz"
  sha256 "2e0d0e77677ccf7166db58de074c789c86bd87a0e4811b8e250c1c8282a1b56d"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.6/"
    sha256 arm64_big_sur: "418fc4abbf1b8ca60164c317c0d0b287386a8a4ee53f90f9d20d3a236b755503"
    sha256 sierra:   "5e3f55ae27893e8ec081948d6a3d9e4bb0e4bf43adb9e4c5fb952d143b8fc520"
    sha256 x86_64_linux:  "0b2f1abf91fa51352dfdf484d83423c74a6152d165707a3c4a47b2c59c499f79"
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
