#!/usr/bin/env sh

cd $HOME
git clone --bare git@github.com:NikolayGalkin/.dotfiles2.git $HOME/.local/share/dotfiles
function dot {
   /usr/bin/git --git-dir=$HOME/.local/share/.dotfiles --work-tree=$HOME $@
}
mkdir -p .backup
dot checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
  dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .backup/{}
fi;
dot checkout
dot config status.showUntrackedFiles no

# source for script
source $HOME/.zshenv

function brew-install {
  # install brew
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | sh
}

function mise-install {
  # install mise
  curl https://mise.run | sh
  eval "$($HOME/.local/bin/mise activate zsh)"
}

exec zsh
