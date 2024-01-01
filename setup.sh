#!/bin/bash


echo "Setup Android Dev for Tuxedo world"
cat list.txt | xargs -I$ echo sudo apt install $

wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip  -O platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~


###
# add Android SDK platform tools to path
###

echo '# add Android SDK platform tools to path'
echo 'if [ -d "$HOME/platform-tools" ] ; then' >> ~/.profile
echo '       PATH="$HOME/platform-tools:$PATH" ' >> ~/.profile
echo 'fi' >> ~/.profile

source ~/.profile


mkdir -p ~/bin
mkdir -p ~/android/lineage

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
git lfs install

sudo apt install ccache

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache

echo "export CCACHE_EXEC=/usr/bin/ccache" >> ~/.bashrc
ccache -M 50G

ccache -o compression=true

