# Updated automatically by figma-cli CI on each release.
# https://github.com/AndVl1/figma-cli/blob/main/.github/workflows/release.yml
class FigmaCli < Formula
  desc "Rust CLI for Figma API — token-efficient alternative to figma-console-mcp"
  homepage "https://github.com/AndVl1/figma-cli"
  version "0.0.0"
  license "MIT"

  # Placeholder — will be replaced by CI on first release
  url "https://github.com/AndVl1/figma-cli"

  def install
    # placeholder
  end

  test do
    assert_match "figma-cli", shell_output("#{bin}/figma-cli --version")
  end
end
