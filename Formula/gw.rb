class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.8/gw-0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "d49e52604965f56a09511cd42fde0f751a61667232b827b66a2bd5869b675185"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.8/gw-0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "cd7e6801f2a01f1b7ebb11fa329447a1815df978fa4e63ed8955eef20dbcbde1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.8/gw-0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0538fd63e370fcb27f733faad71c5b422732a9b394bceea3ef16ec6d5ce47831"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.8/gw-0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "199c6ed5ae45f08b247ba655df7b872e4dd3a6fe6d9379b85af893991b0dc855"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
