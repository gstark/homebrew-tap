cask "t3-code-mine" do
  version "0.1.2-mine.202610281538"
  sha256 "a0ffb56d0598647829a145ec8aa84a6fb210cdde3b42f8c68ef3249dfc50d737"

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
