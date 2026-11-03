cask "t3-code-mine" do
  version "0.1.7-mine.202611030817"
  sha256 "e2132c6ed56c41c70c08f95c9b39093a427056608b3bf84fbc5a5d8b4b23be5d"

  url "https://github.com/gstark/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  name "G$ Code (mine)"
  desc "Personal fork build of T3 Code, rebranded G$ Code"
  homepage "https://github.com/gstark/t3code/tree/mine"

  conflicts_with cask: "t3-code"
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "G$ Code (Alpha).app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/G$ Code (Alpha).app"]
  end
end
