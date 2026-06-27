class Devlens < Formula
  desc "Multi-platform mobile app debugging inspector"
  homepage "https://github.com/AndVl1/probe"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/probe/releases/download/v0.3.0/devlens-macos-aarch64"
      sha256 "653b357ec415b6b8076a6367244fd1c60e0f30b17f2967a5fcb08f0d58f9b18d"
    else
      odie "devlens on macOS requires Apple Silicon (arm64). Intel (x86_64) Macs are no longer supported."
    end
  end

  on_linux do
    url "https://github.com/AndVl1/probe/releases/download/v0.3.0/devlens-linux-x86_64"
    sha256 "90d3ac0ab6af1b866f4748216074a3c51fe955ece65ce9f0e63054a11fe7c4f3"
  end

  def install
    binary_name = Dir.glob("devlens-*").first || "devlens"
    bin.install binary_name => "devlens"
  end

  test do
    assert_match "devlens", shell_output("#{bin}/devlens --version")
  end
end
