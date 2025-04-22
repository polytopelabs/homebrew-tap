class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.33"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.33-macos-amd64.gz"
      sha256 "872d0f6b850693cde0e1dc07bc2be5bffd69e550ee6668ab412194d73cbea2f6"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.33-macos-arm64.gz"
      sha256 "0403874bb8a3e4dd8028ce80187c027fb6e0e1295105d3d1895134ea0c4a4ebc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.33-linux-amd64.gz"
      sha256 "f0b12bb37c913081205ac7a5fdc785d3a7126cfa9d5787aad976663c45ebe1b0"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.33-linux-arm64.gz"
      sha256 "1cb503de1c628a8832592972d4ea6cf19970efeef4e2ff7fea0b531ecaf5375f"
    end
  end

  def install
    bin.install "polytope-cli-0.1.33-#{@@os}-#{@@arch}" => "polytope"
    bin.install_symlink "polytope" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/polytope --version 2>&1"), "0.1.33-ef74d4f7d-#{@@os}-#{@@arch}"
  end
end
