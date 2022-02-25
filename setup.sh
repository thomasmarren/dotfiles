#!/usr/bin/env sh

# This is a rough outline of the steps that are necessary to setup a new system
# with all my tools/settings on macos

#######################################################
#
# Install Xcode from App Store or download link
#
#######################################################


#######################################################
#
# Install homebrew if not found
#
#######################################################
if [ ! $(which brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#######################################################
#
# Install navi
# https://github.com/junegunn/fzf
#
#######################################################
brew install fzf

#######################################################
#
# Install navi
# https://github.com/denisidoro/navi
#
#######################################################

brew install navi
echo '' >> ~/.zshrc
echo '# navi' >> ~/.zshrc
echo 'eval "$(navi widget zsh)"' >> ~/.zshrc
echo 'export NAVI_PATH="$PATH/.navi_cheatsheets"' >> ~/.zshrc
echo '#' >> ~/.zshrc
mkdir -p ~/.navi_cheatsheets
mv ~/dotfiles/.navi_cheatsheets/generic.cheat ~/.navi_cheatsheets/generic.cheat
