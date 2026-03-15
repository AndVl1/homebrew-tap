class FigmaCli < Formula
  desc "Rust CLI for Figma API — token-efficient alternative to figma-console-mcp"
  homepage "https://github.com/AndVl1/figma-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/figma-cli/releases/download/v0.1.1/figma-cli-aarch64-apple-darwin.tar.gz"
      sha256 "1a7504edfe9fa3c358c8d8818803ff4defb4e527c2934f989e3e0e3efdccc38c"
    end
    on_intel do
      url "https://github.com/AndVl1/figma-cli/releases/download/v0.1.1/figma-cli-x86_64-apple-darwin.tar.gz"
      sha256 "5c6ca41971518d1183f60df8f7cd671e5f2a46d62acc6f6612d6adae7548e468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/figma-cli/releases/download/v0.1.1/figma-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8564a1412a310e400dbc2f339d9c858494657b9c6a3e683e2e8eb6e2feb342d3"
    end
    on_intel do
      url "https://github.com/AndVl1/figma-cli/releases/download/v0.1.1/figma-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b23ed01a7a0df836d31952a08a611b132cde55cecd42486657b73a5a390b8da"
    end
  end

  def install
    bin.install "figma-cli"
  end

  test do
    assert_match "figma-cli", shell_output("#{bin}/figma-cli --version")
  end
end
