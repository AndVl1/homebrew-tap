class VisionAnalyze < Formula
  desc "CLI for visual screenshot analysis via llama.cpp"
  homepage "https://github.com/AndVl1/vision-analyze"
  version "0.1.0"
  license "MIT"

  # Requires llama.cpp with a vision-capable model at runtime.
  # See https://github.com/AndVl1/vision-analyze#setup for details.

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.0/vision-analyze-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "89b487a826b4fb71e2ee5d0ab4905742290061e6b28a038b4841062fa9d8aa1a"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.0/vision-analyze-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ffb4c2484bbc38d370787fc64f705857aed55dc98e055f899cba7ffbc99e6f3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.0/vision-analyze-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b769cb995115f7e3558997953ca7ebd6ec9c13794e2e9a6a888c732615738be"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.0/vision-analyze-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "222457411e9561463a9c4755abc54bb95e7c181f197795ef09d757683d62c7b5"
    end
  end

  def install
    bin.install "vision-analyze"
  end

  test do
    assert_match "vision-analyze", shell_output("#{bin}/vision-analyze --version")
  end
end
