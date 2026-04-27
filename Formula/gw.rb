class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.1/gw-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "cdfc7476eee0e4e94edba99250ef6e3d3d58fca7ca350a41f263bc80831ccfdd"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.1/gw-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "6cb0871b36f926e2cfc4256f3a043ff2dcba32a56d3ddcd08c7742f046e6ea79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.1/gw-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6b38bd985c767ba9fc346a6fd91f504bf449f92b820f10da01ccd6319a8f6f5"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.1.1/gw-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c5995a95ec402a7782161d4507c31af4fcbb1b619c8c981926f9a7af03299b1"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
