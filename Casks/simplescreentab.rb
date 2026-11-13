cask "simplescreentab" do
  version "1.1.0"
  sha256 "18436b5c9a77d518f061a5e52b1cea777e519a9402de685a6366fd5ac95ba5ac"

  url "https://github.com/k33ssa/SimpleScreenTab/releases/download/v#{version}/SimpleScreenTab-#{version}.zip"
  name "SimpleScreenTab"
  desc "Per-monitor Cmd-Tab app switcher that shows only apps on the current display"
  homepage "https://github.com/k33ssa/SimpleScreenTab"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "SimpleScreenTab.app"

  uninstall quit:       "local.simplescreentab",
            login_item: "SimpleScreenTab"

  caveats <<~EOS
    Open SimpleScreenTab once and allow Accessibility when macOS asks.
    It then starts at login and replaces Cmd-Tab with a per-monitor switcher.

    The app is free and not notarized. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine #{appdir}/SimpleScreenTab.app
  EOS
end
