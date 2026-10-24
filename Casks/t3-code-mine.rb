cask "t3-code-mine" do
  version "0.0.45-mine.202610232246"
  sha256 "05305c316e778a531c0cddf511dddc6073880814982a14e27f1f549b006875bd"

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
