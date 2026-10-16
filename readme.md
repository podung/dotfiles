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

## Raycast settings

Raycast keeps settings in an encrypted database with no config file, so they're backed up to 1Password instead of this repo. `raycast-sync` (in `files/.local/bin`) uses the op CLI:

```sh
raycast-sync push     # opens Raycast's Export Settings & Data, uploads the .rayconfig
raycast-sync pull     # new machine: downloads it and opens it in Raycast to import
raycast-sync status   # when the backup was last updated
```

The backup is the "Raycast Settings" document in the Personal vault (set `RAYCAST_SYNC_VAULT` to change); its passphrase is "Raycast Export Passphrase", copied to the clipboard when needed. Run `push` after changing hotkeys, snippets, or extensions.

Credit:
https://github.com/MarkBorcherding/dotfiles
https://github.com/thoughtbot/laptop/
