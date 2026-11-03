cask "t3-code-mine" do
  version "0.1.7-mine.202611030845"
  sha256 "fbddb1024858271b812a7687942268f79f5a1c439717f92b82daab0259dd7841"

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
