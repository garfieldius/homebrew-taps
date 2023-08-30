# Generated on 2023.08.30 13:45:01
# Do not edit manually

class T3ll < Formula
  desc "Simple tool for editing TYPO3 localization files"
  homepage "https://github.com/garfieldius/t3ll/"
  url "https://github.com/garfieldius/t3ll/archive/v0.7.4.tar.gz"
  sha256 "3bde95e06480bb6a16087fe767046f93351b08f677ecb93059584015c16b9123"

  bottle do
    root_url "https://github.com/garfieldius/t3ll/releases/download/v0.7.4/"
    sha256 arm64_big_sur: "47678fc52db32f39be3cebca684b1b1ef7caa787d4044138ea497c9badc3c1b9"
    sha256 sierra:   "bac85efcb1a9362a0d0d23b7ae56cccfbbe8a24f2f208bc36d1ae2d738da8f93"
    sha256 x86_64_linux:  "dcc6d943eeb6d7b56d391de11122196b57455a1f6d5ace8e07fd534ecf8ebb8e"
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
