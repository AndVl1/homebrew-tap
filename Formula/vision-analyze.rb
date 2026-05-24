class VisionAnalyze < Formula
  desc "CLI for visual screenshot analysis via llama.cpp"
  homepage "https://github.com/AndVl1/vision-analyze"
  version "0.1.1"
  license "MIT"

  # Requires llama.cpp with a vision-capable model at runtime.
  # See https://github.com/AndVl1/vision-analyze#setup for details.

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.1/vision-analyze-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "5ab2da053f7a037cc546ec16a84abcf69d5ac927715aaf4e35acd1d0f51d8de2"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.1/vision-analyze-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "8eface36514ab641d98e275773041819ae46aa58b39c096a5aea4499e43d2d40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.1/vision-analyze-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "accff4b4a07112ec89438effba08503baf8d573486054cf2305e6c8d7b7fc4e7"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.1/vision-analyze-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95a4d9201c0fec1a51f853fc7afed9b61d0c1742f1bedb70b56f0c8ebaeed842"
    end
  end

  def install
    bin.install "vision-analyze"
  end

  test do
    assert_match "vision-analyze", shell_output("#{bin}/vision-analyze --version")
  end
end
