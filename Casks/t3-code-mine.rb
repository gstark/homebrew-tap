cask "t3-code-mine" do
  version "0.0.44-mine.202610051207"
  sha256 "870fc727d1042da69d6b626ed0945ad45d2eaf6753547275f4649b296f4571dc"

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
