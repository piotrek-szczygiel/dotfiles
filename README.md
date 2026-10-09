# Dotfiles

Minimal terminal + git + AI agents setup for Linux and macOS, managed with [yadm](https://yadm.io/).

## 1. Install packages

**Linux (Arch / CachyOS)**

```sh
sudo pacman -S fish git yadm eza zoxide fd neovim ghostty
paru -S maplemono-nf
```

**macOS**

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install fish git yadm eza zoxide fd neovim
brew install --cask ghostty font-maple-mono-nf 1password betterdisplay google-chrome karabiner-elements
```

## 2. Set fish as the default shell

```sh
command -v fish | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"
```

## 3. SSH key and dotfiles

Every machine gets its own key (used for GitHub and Forgejo); add the public key at
https://github.com/settings/keys and https://git.szczygiel.dev/user/settings/keys.
Other SSH hosts go through the 1Password SSH agent (enable it in 1Password → Settings → Developer).

```sh
ssh-keygen -t ed25519 -C "$(hostname)"
cat ~/.ssh/id_ed25519.pub

yadm clone git@github.com:piotrek-szczygiel/dotfiles
```

## 4. AI agents

```sh
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://opencode.ai/install | bash
```

## Per-machine overrides

- Ghostty: `~/.config/ghostty/local` (untracked), e.g. `font-size = 11` or `working-directory = /home/piotr/Developer`.
