cask "reel" do
  version "0.1.0-202611101701"
  sha256 "21dc9cf019d9b37b23c12dec27f58774f42dba97ee764b8e95676e0e73f786a2"

  url "https://github.com/gstark/reel/releases/download/v#{version}/Reel-#{version}.zip"
  name "Reel"
  desc "Minimal video player built on libmpv"
  homepage "https://github.com/gstark/reel"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Reel.app"

  # The build is ad-hoc signed and not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Reel.app"]
  end

  uninstall quit: "com.gstark.Reel"
end
