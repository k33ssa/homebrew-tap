cask "simplescreentab" do
  version "1.0.0"
  sha256 "b9cfb927bd6384b4a561372b2ba4bc4312f739e07f2c26f142c9465a0d051121"

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
