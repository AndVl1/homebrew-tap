class Devlens < Formula
  desc "Multi-platform mobile app debugging inspector"
  homepage "https://github.com/AndVl1/probe"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/probe/releases/download/v0.5.1/devlens-macos-aarch64"
      sha256 "9591d8f5165693b230eeec8e71a69263d44b4b57cb0663cde77cbac027ff1be8"
    else
      odie "devlens on macOS requires Apple Silicon (arm64). Intel (x86_64) Macs are no longer supported."
    end
  end

  on_linux do
    url "https://github.com/AndVl1/probe/releases/download/v0.5.1/devlens-linux-x86_64"
    sha256 "0cb90c26fbf8989f7ed2d010a20b1c7d961e5c49acf6022e9b1e1aed759d04c3"
  end

  def install
    binary_name = Dir.glob("devlens-*").first || "devlens"
    bin.install binary_name => "devlens"
  end

  test do
    assert_match "devlens", shell_output("#{bin}/devlens --version")
  end
end
