cask "reel" do
  version "0.1.0-202611012211"
  sha256 "649842850b2e45956b4be658e52a5949bc26c436f6d551bff1f90e54fef04d31"

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
