#!/bin/sh

export OPENSHIFT_RUNTIME_DIR=$OPENSHIFT_HOMEDIR/app-root/runtime
cd $OPENSHIFT_RUNTIME_DIR

# get rbenv & ruby-build
git clone https://github.com/sstephenson/rbenv.git
export RBENV_ROOT=$OPENSHIFT_RUNTIME_DIR/rbenv
export PATH=$PATH:$RBENV_ROOT/bin
eval "$(rbenv init -)"
git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build

# install ruby
rbenv install 2.2.2
rbenv shell 2.2.2

# install rails
gem install rails --no-ri --no-rdoc --verbose
