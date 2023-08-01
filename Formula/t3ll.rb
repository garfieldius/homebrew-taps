# Generated on 2023.08.01 13:39:33
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.2.tar.gz"
  sha256 "bc295d116c314f462f14194b8e0bfcb9de776ec19a0ecaaf7be9ac1c95bec2e6"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.2/"
    sha256 arm64_big_sur: "1375327b6a6c6c6f6a8bf4f8c84b70c12b355797a46453de4fe46c1f013be3af"
    sha256 sierra:   "0b64c828a53c3c2cecd8a87b290d726c12d508e12ecc48b08855e85e66d6f303"
    sha256 x86_64_linux:  "cf14c36b35b328b315c08ed437913d21219e8647c6483d24aa3a0b1622b0f7ec"
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
