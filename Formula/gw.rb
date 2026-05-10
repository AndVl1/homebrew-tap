class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.9/gw-0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "2969b482899e53cb880de075f9aa53ae8f96fe4732e5c3ff3eb48db50b15e6ba"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.9/gw-0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "865d3655fafc581c6738a0a63aab0abd3f0a402013397da57d981f44c002e185"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.9/gw-0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0fc9dc8c08bcb29c74b27b21fcc2906d2415ddaf6259b1b5498fbe5b45648bd"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.9/gw-0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7285081a1495943326c7bc191db4fde9a8d58f9936b159dec6b72386d5dc3bfb"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
