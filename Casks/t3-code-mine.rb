cask "t3-code-mine" do
  version "0.0.44-mine.202610081555"
  sha256 "0e0cf0f9ec98271bb4e82060a0320513a905cdfc21d285592977bc1c4c5ad64d"

  url "https://github.com/gstark/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
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
