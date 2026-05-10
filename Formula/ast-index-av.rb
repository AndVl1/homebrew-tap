class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.8/ast-index-av-v3.40.4-av.8-darwin-arm64.tar.gz"
      sha256 "8a8a0f5bbf223d209ad276a8da6e104e39d12d9fdea46f9f6d1abadd951054fc"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.8/ast-index-av-v3.40.4-av.8-darwin-x86_64.tar.gz"
      sha256 "06258b37ab85d0426ef5c6e92790e03a80537a30478e0a10f0ccf22406d0ffbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.8/ast-index-av-v3.40.4-av.8-linux-arm64.tar.gz"
      sha256 "eeaeb5c633b68ea9b7ad07d14616b1caa2e8f07fc14c4526ab2b99b2a0290c79"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.8/ast-index-av-v3.40.4-av.8-linux-x86_64.tar.gz"
      sha256 "d182c1e64368c653fe7eb69f34d7a3a9dbb27500ba2c2ef7936ad03e454b0e6b"
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
