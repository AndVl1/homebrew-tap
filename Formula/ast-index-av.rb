class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-darwin-arm64.tar.gz"
      sha256 "ec13e2eac4a14c4b586d8de4b08ea2d52795b1580bf1eb683caa85a6926bea8b"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-darwin-x86_64.tar.gz"
      sha256 "e0b0db670c9f9c2e89323cd7025a2c04b8109d04f36bd284bb07c610d0cb3807"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-linux-arm64.tar.gz"
      sha256 "853b3aef1ee04b28dcaa9c020321e7b2d890a8cfb3e8b41def2ac17a3205d4a2"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.1/ast-index-av-v3.40.4-av.1-linux-x86_64.tar.gz"
      sha256 "53ce95e3fbb9edd01fa577eadc593ab19b1ce96e557bfa9313bf40a805b70beb"
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
