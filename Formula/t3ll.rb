# Generated on 2023.04.10 14:52:26
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.0.tar.gz"
  sha256 "250c7e4f7dea527a7846bc5725b25d0e2a852fe169f710b693d11fc362c88f75"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.0/"
    sha256 arm64_big_sur: "9ee58db667dac1469358e2692012920925a073b83686ffb526cd2e9cb213a182"
    sha256 sierra:   "3349df8c148691ad211f522aeab143ec551da702eb02079306f5cef9ab1ee71a"
    sha256 x86_64_linux:  "13a21e3b1fc02c3881b76a31ab62c9e6708aae1642bceb3294b6a112bd2a86d5"
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
