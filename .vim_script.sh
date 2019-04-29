#!/bin/bash
clear
mkdir -p "$HOME/.vim/bundle"

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ "$OSTYPE" == "darwin18" ]
then
  echo "==================== MAC OS ===================="
  echo "==================== installing homebrew! ===================="
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "==================== installing python3! ===================="
  brew install python3

  echo "==================== installing pip! ===================="
  sudo easy_install pip

  echo "==================== installing powerline! ===================="
  pip3 install --user powerline-status
  POWERLINE_LOCATION=`pip3 show powerline-status`
  POWERLINE_ARR=($POWERLINE_LOCATION)
  POWERLINE_LENGTH=`echo $POWERLINE_LOCATION | wc -w`

  for ((i=0; i<$POWERLINE_LENGTH; i++))
  do
    if [ "${POWERLINE_ARR[$i]}" == "Location:" ]
    then
      FINAL_POWERLINE_LOCATION="${POWERLINE_ARR[$i+1]}"
    elif [ "${POWERLINE_ARR[$i]}" == "Version:" ]
    then
      FINAL_POWERLINE_VERSION="${POWERLINE_ARR[$i+1]}"
    fi
  done

  echo "export PATH=$PATH:$HOME/Library/Python/$FINAL_POWERLINE_VERSION/bin" >> ~/.bash_profile
  echo "powerline-daemon -q" >> ~/.bash_profile
  echo "POWERLINE_BASH_CONTINUATION=1" >> ~/.bash_profile
  echo "POWERLINE_BASH_SELECT=1" >> ~/.bash_profile
  echo ". $FINAL_POWERLINE_LOCATION/powerline/bindings/bash/powerline.sh" >> ~/.bash_profile
  source ~/.bash_profile
  pip3 install powerline-gitstatus
  echo "{
    \"ext\": {
      \"shell\": {
        \"theme\": \"default_leftonly\"
      }
    }
  }" >> ~/.config/powerline/config.json

  echo "==================== installing powerline fonts! ===================="
  git clone https://github.com/powerline/fonts.git --depth=1 $HOME/fonts
  $HOME/fonts/install.sh
  rm -rf $HOME/fonts
  source ~/.bash_profile

elif [ "$OSTYPE" == "linux-gnu" ]
then
  echo "==================== LINUX ===================="

  echo "==================== installing mosh! ===================="
  sudo add-apt-repository ppa:keithw/mosh
  sudo apt-get update
  sudo apt-get install mosh

  echo "==================== installing pip! ===================="
  sudo apt-get install python-pip

  echo "==================== installing powerline! ===================="
  sudo pip install powerline-status
  echo "if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
          source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
        fi" >> ~/.bashrc

  echo "==================== installing powerline fonts! ===================="
  git clone https://github.com/powerline/fonts.git && sh fonts/install.sh && rm -rf fonts

fi

curl -s https://gist.githubusercontent.com/notmarkmiranda/78dd05f09c58c66a772c2d2403a81a4c/raw/.vimrc > $HOME/.vimrc
vim +PluginInstall +qall
