cask "t3-code-mine" do
  version "0.0.43-mine.202610010912"
  sha256 "5d6d8ce365dbc63694cc34bb2d6926928fd8574cc71fa74dfeecbef86a024648"

  url "https://github.com/gstark/t3code/releases/download/mine-v#{version}/T3-Code-#{version}-arm64.dmg"
  name "T3 Code (mine)"
  desc "Personal fork build of T3 Code"
  homepage "https://github.com/gstark/t3code/tree/mine"

  depends_on arch: :arm64
  depends_on macos: :ventura
  conflicts_with cask: "t3-code"

  app "T3 Code (Alpha).app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/T3 Code (Alpha).app"]
  end
end
