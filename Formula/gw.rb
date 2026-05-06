class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.7/gw-0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "7574cc71952774ea5ff5c0f87febdc079569aea7560970d85eba2d9dd9140e1c"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.7/gw-0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "7984c29fa1de7561dced0cf3077a17c35cc266296cd6dc5d9ca3d08624c0a177"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.7/gw-0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf9b868089916eb041b20410f4ced69805fbfc90150298c410ba3aab586c300b"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.7/gw-0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e8ff058982ba07cb99416dbc5377f5da07a8169af1857baef64e8e45bb8c7a0"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
