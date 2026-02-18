# Dotfiles

Managed with [yadm](https://yadm.io/).

## Setup on a new machine

### 1. Install yadm

```bash
brew install yadm
```

### 2. Clone and configure

Clone via HTTPS (SSH won't be available yet):

```bash
yadm clone https://github.com/piotrek-szczygiel/dotfiles
```

Then switch the remote to SSH:

```bash
yadm remote set-url origin git@github.com:piotrek-szczygiel/dotfiles
```

### 3. Install common tools

```bash
brew install coreutils eza fd fish fzf gh git jq ripgrep tokei uv wget xh yq zoxide
curl -fsSL https://opencode.ai/install | bash
curl -s "https://get.sdkman.io" | bash
sdk install java 25-tem
```

### 4. Install work-related tools

```bash
brew install awscli kubectx tfswitch
```

### 5. Install common applications

- [1Password](https://1password.com/downloads)
- [BetterDisplay](https://github.com/waydabber/BetterDisplay/releases)
- [FlashSpace](https://github.com/wojciech-kulik/FlashSpace/releases)
- [Ghostty](https://ghostty.org/download)
- [Google Chrome](https://www.google.com/chrome/)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/download/)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
- [KeepingYouAwake](https://keepingyouawake.app/)
- [OrbStack](https://orbstack.dev/download)
- [Raycast](https://www.raycast.com/)
- [Rectangle Pro](https://rectangleapp.com/pro)
- [Zed](https://zed.dev/download)

### 6. Install work-related applications

- [Microsoft Outlook](https://apps.apple.com/app/microsoft-outlook/id985367838)
- [Microsoft Teams](https://www.microsoft.com/en/microsoft-teams/download-app)
- [Slack](https://slack.com/downloads/mac)
