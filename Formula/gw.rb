class Gw < Formula
  desc "Gradle output filter for AI coding agents — strips noise, keeps errors/warnings/status"
  homepage "https://github.com/AndVl1/gw"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.5/gw-0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "01e9fd97c9248ef50f620ecf57dd064b61b9f6ce5f3aed1a3ca6af31021f3ef3"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.5/gw-0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "22c345ed74dee96449d17edae600661c26bc080590bf5249563d5b48f05ba69f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.5/gw-0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5721a9818c18fa5225ff51f2a148c2b861d72ff840a28a4c8e380dd9c3e9bc78"
    end
    on_intel do
      url "https://github.com/AndVl1/gw/releases/download/v0.2.5/gw-0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21b5decc949759ee7c8cec363f482b7d9ba6f8afa1700b6791e9967b210f265a"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw", shell_output("#{bin}/gw --version")
  end
end
