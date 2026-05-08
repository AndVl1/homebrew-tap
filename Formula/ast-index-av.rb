class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.4/ast-index-av-v3.40.4-av.4-darwin-arm64.tar.gz"
      sha256 "cfb3b5fa6f7e37022751c2c3370587c06b0794b8bfa42c6d65d190a3484b2d25"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.4/ast-index-av-v3.40.4-av.4-darwin-x86_64.tar.gz"
      sha256 "411a3f112f060dad0290531f730ca72193ac7102668bea70d2045850dfe23646"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.4/ast-index-av-v3.40.4-av.4-linux-arm64.tar.gz"
      sha256 "230e12cb3c6ed21c9d6b5770553d62af5c377202c3c9e62c985be0939ec49c25"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.4/ast-index-av-v3.40.4-av.4-linux-x86_64.tar.gz"
      sha256 "562772b84a4c244c6ff743f7932d35b52ce18c129e1b64970afe69d5dbc7cd09"
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
