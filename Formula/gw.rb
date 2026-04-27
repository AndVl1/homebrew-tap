class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.4/gw-0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "a5e641a3cf0e05290119606caaaca015e14ea7e8ff33c3f8fb2f14326d6279ba"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.4/gw-0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "8dfb4837b5390b815ca9f00656eb3e365fc2380e23af2cba6033a5121ed83bec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.4/gw-0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "772de893b7436384245ca2bea8cae1973c4f42dc4de16aec104674ce65bf76e7"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.4/gw-0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7f69d325b384ef94c3691ad601d9a92b388b16510dd792c7adc09a0bfd7fc28"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
