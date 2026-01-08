class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.42"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.42-macos-amd64.gz"
      sha256 ""
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.42-macos-arm64.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.42-linux-amd64.gz"
      sha256 ""
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.42-linux-arm64.gz"
      sha256 ""
    end
  end

  def install
    bin.install "polytope-cli-0.1.42-#{@@os}-#{@@arch}" => "polytope"
    bin.install_symlink "polytope" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/polytope --version 2>&1"), "0.1.42-a3b01a812-#{@@os}-#{@@arch}"
  end
end
