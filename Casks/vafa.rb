cask "vafa" do
  version "1.0.7"
  sha256 "a7d9beded88196407d34aa464381aa258cc1073eebbfadae57ead4d8980c7c13"

  url "https://github.com/k33ssa/vafa/releases/download/v#{version}/Vafa-#{version}.dmg"
  name "Vafa"
  desc "Blocks selected apps and their network until a VPN is up"
  homepage "https://github.com/k33ssa/vafa"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  installer script: {
    executable: "install.sh",
    sudo:       true,
  }

  uninstall launchctl: "local.vpnguard",
            quit:      "local.vafa.menu",
            script:    {
              executable: "/usr/local/bin/vpn-guard",
              args:       ["uninstall-deferred"],
              sudo:       true,
            },
            delete:    "/Applications/Vafa.app"

  zap trash: [
    "/usr/local/etc/vpn-guard.apps",
    "/usr/local/etc/vpn-guard.conf",
    "/usr/local/etc/vpn-guard.countries",
    "/usr/local/var/log/vpn-guard.log",
  ]
end
