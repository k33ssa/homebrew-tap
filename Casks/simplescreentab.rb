cask "simplescreentab" do
  version "1.3.0"
  sha256 "94590c3f25b21f579911916dbad447965dcab8348e08e7a0c76bcfb5d26cf421"

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
