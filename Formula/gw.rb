class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.6/gw-0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "4612c442c9b47daf818cf5e1b7ba8f431c3ad864b5dcf76128d54aa99560b3ed"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.6/gw-0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "a96551cb91b588af3814c32f4d76d230b116842e07050529b77471cca777c863"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.6/gw-0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34091ae9877a654b3fef75bdccf9c49de8fa2f601fd99fbfef9609027f79da55"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.6/gw-0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "818241cadf7a71c1219d0789e5bb43fbfa97f4f95ca5a7a21f4a3b6365600cd0"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
