class VisionAnalyze < Formula
  desc "CLI for visual screenshot analysis via llama.cpp"
  homepage "https://github.com/AndVl1/vision-analyze"
  version "0.1.2"
  license "MIT"

  # Requires llama.cpp with a vision-capable model at runtime.
  # See https://github.com/AndVl1/vision-analyze#setup for details.

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.2/vision-analyze-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "03bca923f6e7575946481a020e642dc7fe650c6efa1b3738039827a4977072d4"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.2/vision-analyze-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "28567b8075f197f1ef69b768e6a7b2c4a8fdeb660a2c780262a0b53f5049c440"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.2/vision-analyze-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "185339f57da8b9c35c6958d27670dcd1eb129bd75384463dadbad0445a3f4262"
    end
    on_intel do
      url "https://github.com/AndVl1/vision-analyze/releases/download/v0.1.2/vision-analyze-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "428ffe0eab453a888fcff0ab174e2887a837716ffb0cad404b307f382028782b"
    end
  end

  def install
    bin.install "vision-analyze"
    (pkgshare/"presets").install Dir["presets/*"] if Dir.exist?("presets")
  end

  def caveats
    <<~EOS
      vision-analyze needs a llama.cpp backend at runtime:
        brew install llama.cpp
        llama-server -hf ggml-org/SmolVLM-256M-Instruct-GGUF -c 2048 --port 8080

      Optional: Claude Code plugin with skill describing usage.
        /plugin marketplace add AndVl1/claude-plugin
        /plugin install vision-analyze@andvl1-plugins
    EOS
  end

  test do
    assert_match "vision-analyze", shell_output("#{bin}/vision-analyze --version")
  end
end
