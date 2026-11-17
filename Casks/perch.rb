cask "perch" do
  version "0.1.0-202611171045"
  sha256 "2939e4b32d92f16dcac1b64fb003ecf51db260c6ee5ff17d94212435d55391ac"

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
