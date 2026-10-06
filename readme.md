# Dotfiles

Clone to `~/dotfiles`.

## New machine

```sh
git clone <this repo> ~/dotfiles
~/dotfiles/bin/install          # Homebrew, Brewfile, stow, plugins, mise tools, Claude Code
~/dotfiles/bin/osx-settings.sh  # macOS prefs; log out/in afterwards
```

`bin/install` is safe to re-run. Real files that would block stow (e.g. a `~/.zshrc` created by an installer) are moved to `*.pre-dotfiles`.

Optional groups can go in `Brewfile.<group>` and be installed with `brew bundle --file=~/dotfiles/Brewfile.<group>` (none currently).

## Layout

| Path | What |
|---|---|
| `Brewfile`, `Brewfile.*` | Homebrew packages (`brew bundle`) |
| `files/` | Stowed into `~` with `--no-folding` (real dirs, linked files) |
| `secret_files/` | Also stowed, but gitignored — machine-only files like `.gitconfig-work` |
| `files/.config/mise/config.toml` | Global language versions (`mise install`, `mise use -g node@lts`) |
| `files/.zsh_plugins.txt` | zsh plugins (antidote) |
| `files/.vim/plugins.vim` | vim plugins (vim-plug) |

## Where tools come from

- **GUI apps that update themselves** → cask in the `Brewfile` (brew only does the first install).
- **CLIs with a self-updating native installer** (Claude Code) → installed by `bin/install`, never brew/npm.
- **Language runtimes** → mise.
- **Everything else** → formula in the `Brewfile`; update with `brew upgrade`.

## Git identity

`~/.gitconfig` uses the personal email. Repos under `~/projects/work/` pick up `~/.gitconfig-work` (from `secret_files/`), which sets the work email.

Credit:
https://github.com/MarkBorcherding/dotfiles
https://github.com/thoughtbot/laptop/
