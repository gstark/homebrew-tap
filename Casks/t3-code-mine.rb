cask "t3-code-mine" do
  version "0.0.44-mine.202610111424"
  sha256 "d6fcdf9016f590e48f7dd2588206fbd6c9e164df96605a0f3f31e1b468c0bdf5"

  url "https://github.com/gstark/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  name "G$ Code (mine)"
  desc "Personal fork build of T3 Code, rebranded G$ Code"
  homepage "https://github.com/gstark/t3code/tree/mine"

  depends_on arch: :arm64
  depends_on macos: :ventura
  conflicts_with cask: "t3-code"

  app "G$ Code (Alpha).app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/G$ Code (Alpha).app"]
  end
end
