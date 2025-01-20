# Generated on 2025.01.20 11:17:58
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.8.tar.gz"
  sha256 "5d6f71b63fd2994e5a8e67c1b7dad12222a289fa14ce5be92dfc42d9f00bce43"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.8/"
    sha256 arm64_big_sur: "8e230950eb74b249cbeff75aa2eff2e1e5ab175a70370e4b6efee85e71d95526"
    sha256 sierra:   "8d7034f769d685461ce4108bf9e7fcaa75ef12cc4da45c8f3e41de7ecf8dcdb5"
    sha256 x86_64_linux:  "88883a7d9b3a657f534624dcc76201651e7e9f396ec04ecc96a2ad6f035a72af"
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
