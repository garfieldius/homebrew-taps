# Generated on 2024.05.22 13:26:42
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.6.tar.gz"
  sha256 "31d889c1432a6450e894a914cf74713ea0f921ce4577c424aac4bcfa2846948e"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.6/"
    sha256 arm64_big_sur: "03b6f8ad6e9a83a8598324af5df857f86714c0d2424bdcc781d6d36c5964a855"
    sha256 sierra:   "10366613bd41096931ac1856fdc8125bcb983eaf0a0eaa1331c38c759cc26b1f"
    sha256 x86_64_linux:  "c98e1f94627f85ed6f55d0e715e14daa2bbd14ffffda978396e85ee9b1e9bc53"
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
