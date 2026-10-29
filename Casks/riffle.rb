cask "riffle" do
  version "1.0-202610291058"
  sha256 "9354b4109cb0556e156ee2bd64cfd86eb57e4aad8d88a84bdddde85f7343d220"

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
