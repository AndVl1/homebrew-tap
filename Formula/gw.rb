class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.13/gw-0.2.13-aarch64-apple-darwin.tar.gz"
      sha256 "99174ea7afb7236a0276dfb14c3b3caeadaf8b28c85fb1887c2698d6ac78753a"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.13/gw-0.2.13-x86_64-apple-darwin.tar.gz"
      sha256 "9fb8e98e3bbe3469a0567b49c9a9475b7bf32e410f7fe92b23749c6e7de5fa14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.13/gw-0.2.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2daebb88eb76dd74ff54b748d98d173ef16820a265fae6b46bcfe5dfc83db17a"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.13/gw-0.2.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c541dd3ff86c9bd8de3168f543df8dbaa6d23e230d91b22e24958620ac80fdc"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
