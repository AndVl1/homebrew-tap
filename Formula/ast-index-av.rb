class AstIndexAv < Formula
  desc "ast-index fork (AndVl1) — fast code search CLI with experimental features"
  homepage "https://github.com/AndVl1/Claude-ast-index-search"
  license "MIT"
  version "3.40.4-av.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.7/ast-index-av-v3.40.4-av.7-darwin-arm64.tar.gz"
      sha256 "d10cbe09397f13f2bdb9af3f3b10a79de353722609b417f94cf45202f1ea378d"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.7/ast-index-av-v3.40.4-av.7-darwin-x86_64.tar.gz"
      sha256 "e7a6fad4ff52c307fbbc494bc2225cf351a5ae1f7e51d0d57c3c1da4626771ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.7/ast-index-av-v3.40.4-av.7-linux-arm64.tar.gz"
      sha256 "60975bca2048fc1098842156701c2eb02a506565587871c733fc7e3c587d7070"
    else
      url "https://github.com/AndVl1/Claude-ast-index-search/releases/download/v3.40.4-av.7/ast-index-av-v3.40.4-av.7-linux-x86_64.tar.gz"
      sha256 "4e567592b1b213ec2baf6e0572cd1bba654bc60bd01786483d6362927a41d9e7"
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
