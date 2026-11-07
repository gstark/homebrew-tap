cask "perch" do
  version "0.1.0-202611071150"
  sha256 "a2c1d112f18ec5026436967db273305c5a32cdc1cf0882ed84357b6f3be6f0a0"

  url "https://github.com/gstark/perch/releases/download/v#{version}/Perch-#{version}.zip"
  name "Perch"
  desc "Menu bar launcher, clipboard history, calculator and window manager"
  homepage "https://github.com/gstark/perch"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Perch.app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Perch.app"]
  end

  uninstall quit: "com.gstark.perch"
end
