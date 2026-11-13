# k33ssa Homebrew tap

```bash
brew install --cask k33ssa/tap/simplescreentab
brew install --cask k33ssa/tap/vafa
```

| cask | what |
|---|---|
| `simplescreentab` | [SimpleScreenTab](https://github.com/k33ssa/SimpleScreenTab) — per-monitor Cmd-Tab app switcher for macOS: shows only the apps on the display under your mouse. Free AltTab alternative for multi-monitor setups. |
| `vafa` | [Vafa](https://github.com/k33ssa/vafa) — blocks selected apps and their network access until a VPN with an allowed exit country is up (root daemon + menu-bar shield). Asks for the admin password on install. |

## Updates

`brew upgrade` picks up new releases. To update automatically in the background:

```bash
brew tap homebrew/autoupdate
brew autoupdate start --upgrade --cleanup
```
