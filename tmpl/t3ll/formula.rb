# Generated on __DATE__
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v__VERSION__.tar.gz"
  sha256 "__SHASUM_SOURCE__"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v__VERSION__/"
    sha256 arm64_big_sur: "__SHASUM_MACOS_ARM64__"
    sha256 sierra:   "__SHASUM_MACOS_X64__"
    sha256 x86_64_linux:  "__SHASUM_LINUX__"
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
