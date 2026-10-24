cask "shoebox" do
  version "0.1-202610232220"
  sha256 "c974bbb84e548bc8f5cb29534d2eafc992b7fbba19c2d9e991e8323c2457ee90"

  url "https://github.com/gstark/shoebox/releases/download/v#{version}/Shoebox-#{version}.zip"
  name "Shoebox"
  desc "Back up iCloud Photos to a drive or S3"
  homepage "https://github.com/gstark/shoebox"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Shoebox.app"
  binary "#{appdir}/Shoebox.app/Contents/Helpers/shoebox"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Shoebox.app"]
  end

  uninstall quit: "com.gstark.shoebox"
end
