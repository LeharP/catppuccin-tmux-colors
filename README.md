# Catppuccin Tmux

This repository is a fork of a fork of [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux) by Logico. The license of that code was the MIT license, and is maintained in this repository through the `LICENSE.md` file. A huge thank you to their development efforts, whichout which this would not be possible.

The primary purpose of this repository is to take the visual outline of the tokyo-night-tmux plugin but change the colours and themes to be catppuccin. There is also the [tmux repository in the catppuccin organization](https://github.com/catppuccin/tmux) which you may also experiment with and decide on your preference.

## Dependencies

1. You will need to have a [nerd font](https://www.nerdfonts.com/) installed (note the homebrew steps below do this for you)
2. You will need to install the packages below for everything to work.

### Mac

```
brew tap homebrew/cask-fonts
brew install --cask font-monaspace-nerd-font font-noto-sans-symbols-2
brew install bash bc coreutils gawk gh glab gsed jq nowplaying-cli
```

### Linux

#### Alpine Linux

```bash
apk add bash bc coreutils gawk git jq playerctl sed
```

#### Arch Linux

```bash
pacman -Sy bash bc coreutils git jq playerctl
```

#### Debian/Ubuntu

```bash
apt-get install bash bc coreutils gawk git jq playerctl
```

## Installation using TPM

In your `tmux.conf`:

```bash
set -g @plugin "mark-pitblado/catppuccin-tmux"
```
