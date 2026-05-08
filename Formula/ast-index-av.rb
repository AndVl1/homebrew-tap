class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-darwin-arm64.tar.gz"
      sha256 "e91391b8d564a0e5c02a87fd08378c0ff92038108f6fa64f06e1ed4c8d416b20"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-darwin-x86_64.tar.gz"
      sha256 "61a787d30ec526dc1dd20b3a03ef73baeb318ba82481cfd901ac1892bfe56b36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-linux-arm64.tar.gz"
      sha256 "fdeded027722ee3ee153468189d72643c29829f61c3557cc5d91d5b11fe19c05"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-linux-x86_64.tar.gz"
      sha256 "654320ff159eaa8e005f1c4f4305f346ed07d2a3913865da0f63feed41cd6352"
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
