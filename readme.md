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

## Git identity, SSH, and signing

`~/.gitconfig` uses the personal email. Repos under `~/projects/work/` pick up `~/.gitconfig-work` (from `secret_files/`), which sets the work email.

SSH keys live in 1Password (Personal vault), never on disk:

| 1Password item | GitHub key type | Used by |
|---|---|---|
| GitHub Auth | Authentication (SSO-authorized for the work org) | `~/.ssh/config` → `IdentityFile ~/.ssh/github-auth.pub` |
| GitHub Signing | Signing | `.gitconfig` `user.signingkey`, via `op-ssh-sign` |

Only public keys are tracked. One signing key covers both emails (both are verified on the GitHub account); `~/.config/git/allowed_signers` lets `git log --show-signature` verify locally.

New machine: sign in to 1Password, then Settings → Developer → turn on **Use the SSH agent** and **Integrate with 1Password CLI**. Until then, pushes and commits fail (commits are always signed).

Private or machine-specific SSH hosts go in `~/.ssh/config.local` (untracked; included first).

Credit:
https://github.com/MarkBorcherding/dotfiles
https://github.com/thoughtbot/laptop/
