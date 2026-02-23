# Dotfiles

Managed with [yadm](https://yadm.io/).

## Setup on a new MacOS machine

### 1. Install essential tools and setup fish shell

```bash
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install common CLI tools
brew install coreutils eza fastfetch fd fish fzf gh git jq ripgrep starship tokei uv wget xh yadm yq zoxide

# Install opencode
curl -fsSL https://opencode.ai/install | bash

# Install fish and set it as a default shell
brew install fish
which fish | sudo tee -a /etc/shells # Feel free to `cat /etc/shells` first to check if it's already there
chsh -s $(which fish)

# Install fish plugin manager
exec fish -l
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher
```

### 2. Clone dotfiles

We might not have SSH access yet, so we use HTTPS for cloning.

```bash
yadm clone https://github.com/piotrek-szczygiel/dotfiles
yadm remote set-url origin git@github.com:piotrek-szczygiel/dotfiles
```

### 3. Install non-essential tools

```bash
# DevOps stuff
brew install awscli cosign kubectx tenv

# Python
uv python install --default

# Java
curl -s "https://get.sdkman.io" | bash
fisher install reitzig/sdkman-for-fish
sdk install java 21.0.10-amzn # 25-tem
```

### 4. Install common applications

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
- [Stats](https://mac-stats.com/)
- [Zed](https://zed.dev/download)

### 5. Install work-related applications

- [Microsoft Outlook](https://apps.apple.com/app/microsoft-outlook/id985367838)
- [Slack](https://slack.com/downloads/mac)
