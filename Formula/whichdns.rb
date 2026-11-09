class Whichdns < Formula
  desc "Benchmark DNS resolvers and rank them by reliability, then latency"
  homepage "https://github.com/gstark/whichdns"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.0/whichdns-v0.4.0-macos-arm64.tar.gz"
      sha256 "76211cb1f7567c40e7a460ecdbd0d6982f5f698a520869be5f8560ecd8171523"
    end
    on_intel do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.0/whichdns-v0.4.0-macos-x86_64.tar.gz"
      sha256 "f2002eac12a3c3ff389420eabffa396a33113a1bb2bb7d8021dd55f982e2cd4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.0/whichdns-v0.4.0-linux-arm64.tar.gz"
      sha256 "d377854e086c416d8a2a6739cf79fea256207f2fc0d91d3ba612ef86ae4db904"
    end
    on_intel do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.0/whichdns-v0.4.0-linux-x86_64.tar.gz"
      sha256 "77ed162be7caee6068c16ff65514cf787cca81af9c1682d98918d075f49ec3c4"
    end
  end

  def install
    bin.install "whichdns"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/whichdns --version").strip
  end
end
