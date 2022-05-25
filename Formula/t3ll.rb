# Generated on 2022.05.25 16:50:48
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.6.5.tar.gz"
  sha256 "2b60a6feeff9fe7b67587f0bc0eb2c6fe3528cae13b9b959f6e723f13d9f522b"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.6.5/"
    sha256 arm64_big_sur: "8f4a68e09f6e4ec5bcd73bf530745e1e9ca280818fefda5a51c0e05562cfe7b8"
    sha256 sierra:   "dbd57d82729b9bb5da750debc401226cad18ab4a11d6ee25f5809eae85777fb9"
    sha256 x86_64_linux:  "ff650b9e7a21ec1c612eb5e04aa0cd79e404e0919699fda9746f3cae11806648"
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
