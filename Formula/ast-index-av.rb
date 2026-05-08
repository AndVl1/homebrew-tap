class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.5/ast-index-av-v3.40.4-av.5-darwin-arm64.tar.gz"
      sha256 "caf7d925a6489dbd3d39a82d1eb1804b47bc08925a51a171ba5c94c9478560d7"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.5/ast-index-av-v3.40.4-av.5-darwin-x86_64.tar.gz"
      sha256 "b31cf2a4105a4116ee14c585931b9abe0db897582fb9cbdbaa227f6ea0c8e4c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.5/ast-index-av-v3.40.4-av.5-linux-arm64.tar.gz"
      sha256 "b599735bde48c378ee3d64f0964bef1bee61abf2ca984bf31e4dbdbee50f5935"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.5/ast-index-av-v3.40.4-av.5-linux-x86_64.tar.gz"
      sha256 "519d9f764efbae36be65483ed000d4cb509ccb7e757bbaa1bf891540f9ab2dfe"
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
