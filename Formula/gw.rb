class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.11/gw-0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "b38d13292b5dcd7e166cb683011b32908e464fd5d29bd46ef8ca569f30de038e"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.11/gw-0.2.11-x86_64-apple-darwin.tar.gz"
      sha256 "57d7a168336687ad2c8dff5dde42641e66ee11d1a93a78ca5aebfa6c402358f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.11/gw-0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e1df57d829fa9eac2237c6bccac6a96d054e0e6b13ca15c3a8bcae24f004162"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.11/gw-0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13e1db11c8b9c46f66e3cafc9c397e8e4fff5129c2c6a8daca53945bfc457415"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
