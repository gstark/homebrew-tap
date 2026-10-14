cask "t3-code-mine" do
  version "0.0.45-mine.202610141904"
  sha256 "c1f616d00dfdac6d27a767b1dceba928d83c143c5b307ee8c6529e4c0b41da93"

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
