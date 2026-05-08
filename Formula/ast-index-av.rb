class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.2/ast-index-av-v3.40.4-av.2-darwin-arm64.tar.gz"
      sha256 "f3c53678c047f9adc3dbbf25973a795057d12256af753ee76d969ecef5047352"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.2/ast-index-av-v3.40.4-av.2-darwin-x86_64.tar.gz"
      sha256 "f389cdc7ee5bde6fda6c587c205a0ad86b98e05a799eadcc179d1ba7b5d60298"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.2/ast-index-av-v3.40.4-av.2-linux-arm64.tar.gz"
      sha256 "e61a34b2e9c8e0fe0c9f0f4ed4d6bfc469412b7c800302d8a0fc0d9a46574d19"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.2/ast-index-av-v3.40.4-av.2-linux-x86_64.tar.gz"
      sha256 "f1489b8fcf39607142c3438b5e32dcfa3d0334f9b0da0c30b70b2ba419014fc5"
    end
  end

  def install
    # Install real binary to libexec, then write a tiny wrapper to
    # bin/ that sets a fork-specific cache namespace before exec.
    # Keeps fork's SQLite cache isolated from the upstream binary
    # (~/Library/Caches/ast-index-av/ vs ~/Library/Caches/ast-index/),
    # so schema-incompatible changes on the fork can't corrupt
    # upstream state and vice versa.
    libexec.install "ast-index-av" => "ast-index-av-bin"
    (bin/"ast-index-av").write <<~SH
      #!/bin/bash
      export AST_INDEX_CACHE_NAMESPACE="${AST_INDEX_CACHE_NAMESPACE:-ast-index-av}"
      exec "#{libexec}/ast-index-av-bin" "$@"
    SH
    (bin/"ast-index-av").chmod 0755
  end

  test do
    # Binary's baked-in version comes from Cargo.toml (upstream,
    # e.g. 3.40.2) — not the fork tag (3.40.2-av.N). Just check
    # the wrapper invokes the binary cleanly.
    assert_match "ast-index", shell_output("#{bin}/ast-index-av version")
  end
end
