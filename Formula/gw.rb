class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.3/gw-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "fd5821e98205ec860b7e33d7ef7f846b115d4cc9901cd2c1376d4fbb18e80c2b"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.3/gw-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "f66bcc76d691518d2094ea62df2bfb74b8224079d6317bd4bc87a97b18dabc65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.3/gw-0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "525ab579a5089c3842505dcf54062fe27c4e2f4e8fa59fce90a5a07becf10ebf"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.3/gw-0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af9a3a17ab2e8716127521c8b08554ca94f49e0c9ba1200f01fba9863394a5b7"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
