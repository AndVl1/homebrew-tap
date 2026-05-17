class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.12/gw-0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "3273f169227f0f670dc697d2139d9d3d71a672b691e9a94520bd655d3e61f588"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.12/gw-0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "4246f43f07cecc57b3aabfa6d06d6cb3d55635a608de569334065c27f5e45018"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.12/gw-0.2.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5436a005e7e641a538ce1e1ccc1bc8f1f44b53574ddfaeb9d169f0618cb8623"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.12/gw-0.2.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab446cf014ef9203ff9fd7c2ee1e96d94ca55d40ad40b6e71b8efcc49123b926"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
