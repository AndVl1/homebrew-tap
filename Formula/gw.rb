class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.14/gw-0.2.14-aarch64-apple-darwin.tar.gz"
      sha256 "0dda2ac84a2a02e395401e2afa5c2a03ce532df0c707e342ec97729f63db5b0c"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.14/gw-0.2.14-x86_64-apple-darwin.tar.gz"
      sha256 "7afb9b408c84bad89874a33e68289aa8fdad0112b2cd610c2059e3e5d5d31746"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.14/gw-0.2.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61a28bad9075f89eee254cdda239ad94fb43de1a813a8b98c6ab28c442f129a3"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.14/gw-0.2.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df99d6f804827b9caecc0b3f3e6329f8689119ab617c5f7f3c924c3fc4df2076"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
