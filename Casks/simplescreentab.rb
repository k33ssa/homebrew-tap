cask "simplescreentab" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/k33ssa/SimpleScreenTab/releases/download/v#{version}/SimpleScreenTab-#{version}.zip"
  name "SimpleScreenTab"
  desc "Per-monitor Cmd-Tab app switcher that shows only apps on the current display"
  homepage "https://github.com/k33ssa/SimpleScreenTab"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "SimpleScreenTab.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SimpleScreenTab.app"]
    system_command "/usr/bin/open", args: ["#{appdir}/SimpleScreenTab.app"]
  end

  uninstall quit:       "local.simplescreentab",
            login_item: "SimpleScreenTab"
end
