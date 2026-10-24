cask "perch" do
  version "0.1.0-202610232243"
  sha256 "3de4db69235e250c01461accd897de456d82eeb9cd0b5ef0a55048396ac1a014"

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
