class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.6/ast-index-av-v3.40.4-av.6-darwin-arm64.tar.gz"
      sha256 "e77c36a2e4348c1fe1075ddc4b0eaa827ae67e76b51687f64ecfa43e079c4983"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.6/ast-index-av-v3.40.4-av.6-darwin-x86_64.tar.gz"
      sha256 "dc60b3fd711140b275d366780fba685e1b70a8ea54c81bc3553dfc7360ec2b6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.6/ast-index-av-v3.40.4-av.6-linux-arm64.tar.gz"
      sha256 "0a66350952d7e0d5c15395e160ab9565cb6f7fa79b449b0f8e91d5cf8f37306e"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.6/ast-index-av-v3.40.4-av.6-linux-x86_64.tar.gz"
      sha256 "edb9ebd87531682a5b99c95d9e863bf5e182ca2bba41a547421c4f9dd626916d"
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
