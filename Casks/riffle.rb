cask "riffle" do
  version "1.0-202610290933"
  sha256 "4cb3dc7088d80d329c6dfe913c88883066601b55b0fe36f6153fcd657b9c6bdc"

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
