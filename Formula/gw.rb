class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.0/gw-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "28d9b52cbc7517eeeac692b0a380b0ec518811bb21bc0c52eb95802641c405b8"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.0/gw-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c0f537575b35fe91531c003f8c9185bd33aed0c82a16a495252149992c037dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.0/gw-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cf1cf43e5916f4c356cdcec89bb6af4840a949f5bea37eda41ccc4a42f86f2e"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.0/gw-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6efc0f689216e9740380a175aac51dc1456e59155c76dcefd7330dee41e3e26c"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
