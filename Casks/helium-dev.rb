cask "helium-dev" do
  version "0.1-202610292227"
  sha256 "0ef65c410951c6e4927b4f3cc5494229a623f207b455b6e06c9ecc7a2b558b9d"

  url "https://github.com/gstark/chrome-devtools-network-status-filters/releases/download/v#{version}/Helium-Dev-#{version}.zip"
  name "Helium Dev"
  desc "Default browser that opens Helium with a custom DevTools frontend"
  homepage "https://github.com/gstark/chrome-devtools-network-status-filters"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Helium Dev.app"

  # The build is signed but not notarized, so remove the quarantine flag to let it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Helium Dev.app"]
  end

  caveats <<~CAVEATS
    Open Helium Dev once to make it the default browser. macOS asks you to confirm.
    To ask again later, run:
      open -a "Helium Dev" --args --make-default
  CAVEATS
end
