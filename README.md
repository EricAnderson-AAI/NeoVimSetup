OSX NeoVim Install
==================

[Homebrew formula for neovim.](https://github.com/neovim/homebrew-neovim)

NeoVim Python Commands
====================

[NeoVim Commands](https://neovim.io/doc/user/nvim_python.html)

iTerm2 Theme Install
====================

Go to Profiles > Preferences > Colors > Import...

Install zsh
====================

brew install zsh

Edit /etc/shells and add "/usr/local/bin/zsh" to the end of the file
Then run:

chsh -s /usr/local/bin/zsh

Fonts
====================
[nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

Other Needed Commands
====================

brew install python2
brew install python3
sudo chown -R "$USER":admin /usr/local
sudo chown -R "$USER":admin /Library/Caches/Homebrew
