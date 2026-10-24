class Posterize < Formula
  include Language::Python::Virtualenv

  desc "Convert flat-color PNGs into multi-plate, multi-color 3MF prints"
  homepage "https://github.com/gstark/posterize"
  url "https://github.com/gstark/posterize/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2a948a40ab2960ba28119dae3c195f34c13cca8e8525728b28acfc8de83bf614"
  license "MIT"
  head "https://github.com/gstark/posterize.git", branch: "main"

  depends_on "pillow"
  depends_on "potrace"
  depends_on "python@3.14"

  resource "bambu3mf" do
    url "https://github.com/gstark/bambu3mf/archive/a4c1e019796d5b9363bfc3e9499bc81cc5880d90.tar.gz"
    sha256 "b0570c60160ddf3b40a85edb11d4c9cace795f7464c291e1d4fcbfb91cb17bb4"
  end

  resource "jinja2" do
    url "https://files.pythonhosted.org/packages/df/bf/f7da0350254c0ed7c72f3e33cef02e048281fec7ecec5f032d4aac52226b/jinja2-3.1.6.tar.gz"
    sha256 "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
  end

  # lib3mf publishes wheels only. Each wheel bundles the native lib3mf library.
  resource "lib3mf" do
    on_macos do
      url "https://files.pythonhosted.org/packages/04/87/47504d69f0f36841670d12ce3fe1668025bad74d83ed361ead378f626fed/lib3mf-2.5.0-py3-none-macosx_10_9_universal2.whl"
      sha256 "f7dc57ea22214fa92dac728ba66e58c4b24b775d467888262a820338d7d84145"
    end
    on_linux do
      url "https://files.pythonhosted.org/packages/88/83/8b987ba95ac0ed9cc7e9c407a579bf43eff6349b1792b4a66c992ce4f76b/lib3mf-2.5.0-py3-none-manylinux2014_x86_64.whl"
      sha256 "b4c00033c47cfeac93b7daa069fb46e8dea4391d5522b79cd6e9f6af75e33013"
    end
  end

  resource "linkify-it-py" do
    url "https://files.pythonhosted.org/packages/45/98/7a1a5f31fd5c7ba93e963b168e244b8e3dd705b3d2a718e3c3307583bf57/linkify_it_py-2.2.0.tar.gz"
    sha256 "907acd2d17ac1fbb9ddb62c8957ccbd6158cac602231a15c3b0cd1e215f03cee"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "markupsafe" do
    url "https://files.pythonhosted.org/packages/7e/99/7690b6d4034fffd95959cbe0c02de8deb3098cc577c67bb6a24fe5d7caa7/markupsafe-3.0.3.tar.gz"
    sha256 "722695808f4b6457b320fdc131280796bdceb04ab50fe1795cd540799ebe1698"
  end

  resource "mdit-py-plugins" do
    url "https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56/mdit_py_plugins-0.6.1.tar.gz"
    sha256 "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "platformdirs" do
    url "https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09/platformdirs-4.13.5.tar.gz"
    sha256 "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/00/21/39a76b01bd5eea82a04baaca7580e105d8c59450df03998345bb2cfb307b/textual-8.2.8.tar.gz"
    sha256 "3f106a9fbc73e39dd266c9712432087de78a6d644084c7c241d6a25c3169115b"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")

    # Staging would unpack the wheel, so give pip the downloaded file under
    # its real wheel name instead.
    lib3mf = resource("lib3mf")
    wheel = buildpath/File.basename(lib3mf.url)
    cp lib3mf.fetch, wheel
    venv.pip_install wheel

    venv.pip_install resources.reject { |r| r.name == "lib3mf" }
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      posterize needs OpenSCAD, which Homebrew ships only as a cask:
        brew install --cask openscad@snapshot

      Run `posterize config` to set your defaults and filament library.
    EOS
  end

  test do
    assert_match "Convert a flat-color PNG", shell_output("#{bin}/posterize --help")

    ENV["POSTERIZE_CONFIG"] = testpath/"config.toml"
    system libexec/"bin/python", "-c", <<~PYTHON
      from PIL import Image
      image = Image.new("RGBA", (4, 2), (255, 0, 0, 255))
      image.putpixel((0, 0), (0, 0, 255, 255))
      image.save("art.png")
    PYTHON
    output = shell_output("#{bin}/posterize art.png --optimal-filament-colors")
    assert_match "#FF0000", output
    assert_match "#0000FF", output

    system libexec/"bin/python", "-c", "import bambu3mf, lib3mf, textual"
  end
end
