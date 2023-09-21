# Generated on 2023.09.21 14:42:39
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.5.tar.gz"
  sha256 "9de4f53374cd7ebb1d729136f4f7b4d20aa625f1c86127acb6dcdbf3d1ed0b60"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.5/"
    sha256 arm64_big_sur: "a507bfd7bc3d11de5718374940a5667abb6c70ccb800dfc3adec277cef56b97d"
    sha256 sierra:   "fa9f6172ce7e8f9de9b7e5be1430b9cd316986554629caab28fb294b20e6ed38"
    sha256 x86_64_linux:  "bf67e4d0e930fadb32a2ad79f848952ad64e3c3bc164115e1af3ee958e572cc6"
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
