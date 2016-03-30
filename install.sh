#!/usr/bin/env zsh
DOTFILES="$HOME/dotfiles"


ln -s "$DOTFILES/i3/config.base" "$HOME/.config/i3/config.base"
ln -s "$DOTFILES/j4-make-config/themes" "$HOME/.config/i3/themes"
"$DOTFILES/j4-make-config/j4-make-config" -r solarized

ln -s "$DOTFILES/zshrc" "$HOME/.zshrc"
ln -s "$DOTFILES/zlogin" "$HOME/.zlogin"

