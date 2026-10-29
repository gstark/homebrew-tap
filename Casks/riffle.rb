cask "riffle" do
  version "1.0-202610291128"
  sha256 "7788032b1ea2a02ad8e91746c4a6d46c193b9082585eb89d560dbbaab96c9caf"

  url "https://github.com/gstark/riffle/releases/download/v#{version}/Riffle-#{version}.zip"
  name "Riffle"
  desc "Menu bar search for a Gmail backup"
  homepage "https://github.com/gstark/riffle"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Riffle.app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Riffle.app"]
  end

  uninstall quit: "com.gstark.riffle"
end
