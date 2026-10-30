cask "helium-dev" do
  version "0.1-202610292223"
  sha256 "1d5313daa6c36992ddb36faae913a2f9e7589af6365829c86d355bbd6681d844"

  url "https://github.com/gstark/chrome-devtools-network-status-filters/releases/download/v#{version}/Helium-Dev-#{version}.zip"
  name "Helium Dev"
  desc "Default browser that opens Helium with a custom DevTools frontend"
  homepage "https://github.com/gstark/chrome-devtools-network-status-filters"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Helium Dev.app"

  postflight_steps do
    # The build is signed but not notarized, so remove the quarantine flag to let it open.
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Helium Dev.app"]
    # Make Helium Dev the default browser. macOS asks for confirmation.
    run "/usr/bin/open", args: ["-a", "{{appdir}}/Helium Dev.app", "--args", "--make-default"]
  end
end
