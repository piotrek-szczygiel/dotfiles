# Dotfiles

Managed with [yadm](https://yadm.io/).

## Setup on a new machine

### 1. Install zerobrew and setup shell

```bash
curl -fsSL https://zerobrew.rs/install | bash
zb install fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
```

Close & Re-open the terminal to use fish shell.

```bash
zb init
curl -s "https://get.sdkman.io" | bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher reitzig/sdkman-for-fish
```

Close & Re-open the terminal again.

### 2. Clone and configure

Clone via HTTPS (SSH won't be available yet):

```bash
zb install yadm
yadm clone https://github.com/piotrek-szczygiel/dotfiles
```

Then switch the remote to SSH:

```bash
yadm remote set-url origin git@github.com:piotrek-szczygiel/dotfiles
```

### 3. Install common tools

```bash
zb install coreutils eza fd fish fzf gh git jq ripgrep starship tokei uv wget xh yq zoxide
curl -fsSL https://opencode.ai/install | bash
sdk install java 25-tem
uv python install --default
```

### 4. Install work-related tools

```bash
zb install awscli cosign kubectx tenv
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
- [LinearMouse](https://linearmouse.app/)
- [OrbStack](https://orbstack.dev/download)
- [Raycast](https://www.raycast.com/)
- [Rectangle Pro](https://rectangleapp.com/pro)
- [Zed](https://zed.dev/download)

### 6. Install work-related applications

- [Microsoft Outlook](https://apps.apple.com/app/microsoft-outlook/id985367838)
- [Slack](https://slack.com/downloads/mac)
