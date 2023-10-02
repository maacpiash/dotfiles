Dotfiles, managed with [Chezmoi](https://www.chezmoi.io).

### Included configurations

- Git
- Fish shell
- Neovim
- Tmux

### How to apply these settings

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply maacpiash
```

If you already have Tmux, Neovim, Git, Starship, and other necessary stuff installed, then the command above would set everything up just fine. In that case, you can ignore the preparation section below and go straight to the modifications part.

### Preparation

You're gonna need to install the necessary packages to make everything work properly. For macOS, Debian, and its derivatives (including Ubuntu and *its* derivatives, such as Linux Mint), I recommend Homebrew, since it is arguably the best package manager for macOS and contains many more up-to-date packages compared to `apt`.

To install Homebrew (if you don't have it installed):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then,

```bash
brew install git git-delta gnupg neovim pnpm starship tmux
```

Now, if you had already applied the very first command in the previous section – the one with the `get.chezmoi.io` part – then you already have Chezmoi installed and these dotfiles in-place. You can go straight to the modifications section.

Otherwise, the following additional commands would be required. The first command would install Chezmoi on your machine.

```bash
brew install chezmoi
```

Finally, this final command would put these dotfiles in proper directories.

```bash
chezmoi init --apply maacpiash
```

#### "Butbutbut I use Windows!"

*Then just get [WSL](https://learn.microsoft.com/en-au/windows/wsl)!*

#### Neovim-specific steps

I'm using Packer as the plugin manager for Neovim. You can install Packer by the following command:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

**Migration to `lazy.nvim` is on the roadmap.**

### Modifications

Please modify the following:

- the `user` section of `.gitconfig`
- the path to PNPM in `config.fish` in `~/.config/fish` directory
- the path to OmniSharp language server in `lsp.lua` file in `~/.config/nvim/lua` directory
