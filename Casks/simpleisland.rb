cask "simpleisland" do
  version "1.0.0"
  sha256 "fe3eb9d287375af0cefc471e7ffa058bb81633839705bf92adbc6fadd4b60121"

  url "https://github.com/k33ssa/SimpleIsland/releases/download/v#{version}/SimpleIsland-#{version}.zip"
  name "SimpleIsland"
  desc "Dynamic Island for the Mac notch: music with synced lyrics, shelf, agents, HUD"
  homepage "https://github.com/k33ssa/SimpleIsland"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "SimpleIsland.app"

  uninstall quit:       "local.simpleisland",
            login_item: "SimpleIsland"

  zap trash: "~/Library/Application Support/SimpleIsland"

  caveats <<~EOS
    Open SimpleIsland once. macOS asks for permissions when a feature first needs them
    (Accessibility for menu bar cleanup, Calendar for Today, Automation for Music/Spotify).

    The app is free and not notarized. If macOS refuses to open it, run:
      xattr -dr com.apple.quarantine #{appdir}/SimpleIsland.app
  EOS
end
