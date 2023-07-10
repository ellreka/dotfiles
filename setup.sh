#! /bin/bash

# Get the directory of the current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo $DIR

# fish
mkdir -p ~/.config/fish/functions
ln -s -f "$DIR/fish/abbreviations.fish" ~/.config/fish
ln -s -f "$DIR/fish/config.fish" ~/.config/fish
ln -s -f "$DIR/fish/fish_plugins" ~/.config/fish
ln -s -f "$DIR/fish/functions/fish_prompt.fish" ~/.config/fish/functions
# Run fisher update in fish shell
fish -c 'fisher update'

# git
ln -s -f "$DIR/git/.gitconfig" ~/.gitconfig
mkdir -p ~/.config/git
ln -s -f "$DIR/git/ignore" ~/.config/git

# karabiner-elements
mkdir -p ~/.config/karabiner/assets/complex_modifications
ln -s -f "$DIR/karabiner/dvorak_jis.json" ~/.config/karabiner/assets/complex_modifications

# nvim
mkdir -p ~/.config/nvim
ln -s -f "$DIR/nvim/init.vim" ~/.config/nvim