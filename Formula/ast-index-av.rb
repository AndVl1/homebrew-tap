class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.3/ast-index-av-v3.40.4-av.3-darwin-arm64.tar.gz"
      sha256 "da0599404e9ac318029d8fbf5d66214e381f823a069bc2c0ed3142a4df8ffad8"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.3/ast-index-av-v3.40.4-av.3-darwin-x86_64.tar.gz"
      sha256 "13975697406c55f47b9dc44d6b8547b6b1b6ee9498a498906d6772e39a9bda1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.3/ast-index-av-v3.40.4-av.3-linux-arm64.tar.gz"
      sha256 "191f62e92fed26b9a8e4d3bedc795b48889e5186e3f78bc86a4b993d12b8eb93"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.3/ast-index-av-v3.40.4-av.3-linux-x86_64.tar.gz"
      sha256 "4b8eb24b35f79e73f5f7e31a6c22ef9881016b12bc9d34f59dfd0fcbc0e0d7e1"
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
