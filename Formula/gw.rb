class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.10/gw-0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "45d544a903ac1422e7f72b827dd66750a2fc61f58a8250a2a5d69971e41759f2"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.10/gw-0.2.10-x86_64-apple-darwin.tar.gz"
      sha256 "e003ed3cf1bd9ad5069977264e952e724b995df158d77b10a2226bcda6241405"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.10/gw-0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8804d28dc9ffb2d4fb017c4113ea5a63a7b505dcb349f85f14da16b3289a2c43"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.10/gw-0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b193b04de7a8b12c3e0236385f9071f299ec11b8d2dc4cda813a4617f7662a84"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
