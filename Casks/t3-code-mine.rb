cask "t3-code-mine" do
  version "0.0.44-mine.202610051231"
  sha256 "1ac1e5475fec0ab1e647a59a0e1f3b674cf1427fec62b5e0d09b2acf453ae855"

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
