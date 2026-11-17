cask "perch" do
  version "0.1.0-202611171029"
  sha256 "ccf2c16068f0df6aacc30640035bb6787d49454d9d0c87c4c51bcdc5ac3647b4"

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
