class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.0/gw-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "bf1b8f51097015f4eb785f987be49f691b232e426924e51f2ed8e6f8e29a5485"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.0/gw-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "9672e86fe5a9fd70a82646ccf576ba5720923e8b339cb6fdfd31d197450c8fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.0/gw-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "081f61ab6ac2b67cbeb3680822520ec6af08de9fda753f5d0e2bce6fa4da2386"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.0/gw-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90912595256ea9afaba704be3c4b05c7b5ac577a6a0f19d9882a4a2335eb801c"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
