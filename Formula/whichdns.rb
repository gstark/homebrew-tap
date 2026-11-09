class Whichdns < Formula
  desc "Benchmark DNS resolvers and rank them by reliability, then latency"
  homepage "https://github.com/gstark/whichdns"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.1/whichdns-v0.4.1-macos-arm64.tar.gz"
      sha256 "168f2fd3b7352c02d440c98ed97422ad8f720152cdfb75a807213c72ad792028"
    end
    on_intel do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.1/whichdns-v0.4.1-macos-x86_64.tar.gz"
      sha256 "a7aa683137c9ab39a3f70061049db23796947e94a117c9e763d2a222a97e84b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.1/whichdns-v0.4.1-linux-arm64.tar.gz"
      sha256 "a38dff93d98b5d93a751eafd029217b156c42c1da0341665bff40ca62f1e45e7"
    end
    on_intel do
      url "https://github.com/gstark/whichdns/releases/download/v0.4.1/whichdns-v0.4.1-linux-x86_64.tar.gz"
      sha256 "01a7d8705508d6ef7c7c1b3faacc634db8c9a62a7fd6647919c7f523172044e6"
    end
  end

  def install
    bin.install "whichdns"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/whichdns --version").strip
  end
end
