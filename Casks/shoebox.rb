cask "shoebox" do
  version "0.1-202610232237"
  sha256 "86863fe94583925073c84e3c46928a397e7239e5649cbb067b629bd50a8e99c9"

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
