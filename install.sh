#!/usr/bin/env zsh
DOTFILES="$HOME/dotfiles"

mkdir "$HOME/.npm-global"

mkdir -p "$HOME/.config/i3/"
ln -s "$DOTFILES/i3/config.base" "$HOME/.config/i3/config.base"
ln -s "$DOTFILES/i3/i3blocks.conf" "$HOME/.config/i3/i3blocks.conf"
ln -s "$DOTFILES/j4-make-config/themes" "$HOME/.config/i3/themes"
"$DOTFILES/j4-make-config/j4-make-config" -r solarized

ln -s "$DOTFILES/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/zlogin" "$HOME/.zlogin"
ln -s "$DOTFILES/vimrc" "$HOME/.vimrc"
ln -s "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -s "$DOTFILES/gitignore" "$HOME/.gitignore"
ln -s "$DOTFILES/npmrc" "$HOME/.npmrc"
ln -s "$DOTFILES/termite" "$HOME/.config/termite"

mkdir -p "$HOME/.local/share/systemd/user/"
ln -s "$DOTFILES/ssh-agent.service" "$HOME/.local/share/systemd/user/ssh-agent.service"

