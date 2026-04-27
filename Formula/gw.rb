class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.2/gw-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "80092964e6b98fb53abc58eaa63db675a1d9afbc91a2dc8cf3f9349d4632c545"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.2/gw-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "73ff383cef71dde387b80fbbbb74c0cf0cf1d46871a587b066395ec606e4f3bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.2/gw-0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a51dd68a9720b5aa3c510e5947fa32bf1cce6bca764f0db08ab34dd80385f45"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.2/gw-0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b7af3ca4fc28f98d8464494cb8241fa6092a290d7daf699455965f8838d6f28"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
