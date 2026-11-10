cask "perch" do
  version "0.1.0-202611092126"
  sha256 "92d340af03d3f223d90e680023f63159ee75fdf3e5c3a9a35f5db88a088bb9a2"

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
