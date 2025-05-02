class PolytopeCli < Formula
  desc "The Polytope CLI"
  homepage "https://polytope.com"
  version "0.1.34"

  @@os = "#{OS.mac? ? 'macos' : 'linux'}"
  @@arch = "#{Hardware::CPU.intel? ? 'amd64' : 'arm64'}"

  on_macos do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.34-macos-amd64.gz"
      sha256 "dcf2bd57cb49841aff402c4343ad822001a810b930ee1a2a2778d8cd863ac0e6"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.34-macos-arm64.gz"
      sha256 "602736e30558d06959381d07890a13cb1fe5e785ed91bd5ee8ddc2d60f2ac404"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://polytope.com/releases/polytope-cli-0.1.34-linux-amd64.gz"
      sha256 "c8e9273673e32520243501a3b7f17f2b978cbbd9b1840cee68b0d5d1591e2f2b"
    elsif Hardware::CPU.arm?
      url "https://polytope.com/releases/polytope-cli-0.1.34-linux-arm64.gz"
      sha256 "e3671a78b47aa329cbe702dce42a8173aaeaae304d78940bc8a9acf85ee8d3d7"
    end
  end

  def install
    bin.install "polytope-cli-0.1.34-#{@@os}-#{@@arch}" => "polytope"
    bin.install_symlink "polytope" => "pt"
  end

  test do
    assert_includes shell_output("#{bin}/polytope --version 2>&1"), "0.1.34-6d4ccae04-#{@@os}-#{@@arch}"
  end
end
