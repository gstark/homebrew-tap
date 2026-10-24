cask "riffle" do
  version "1.0-202610232312"
  sha256 "6e0d367eab9a3401ece31028d48b39a4be5af5287be605df9d2aab8b0998b9f3"

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
