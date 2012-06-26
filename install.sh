#!/bin/sh

cd $OPENSHIFT_TMP_DIR

# get & compile yaml
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar xzf yaml-0.1.4.tar.gz
cd yaml-0.1.4
./configure --prefix=$OPENSHIFT_RUNTIME_DIR
make
make install

# clean up yaml sources
cd $OPENSHIFT_TMP_DIR
rm -rf yaml*

# get ruby
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
tar xzf ruby-1.9.3-p194.tar.gz
cd ruby-1.9.3-p194

# export directory with yaml.h
export C_INCLUDE_PATH=$OPENSHIFT_RUNTIME_DIR/include

# export directory with libyaml
export LIBYAMLPATH=$OPENSHIFT_RUNTIME_DIR/lib

cd ext/psych
sed -i '1i $LIBPATH << ENV["LIBYAMLPATH"]' extconf.rb

cd $OPENSHIFT_TMP_DIR
cd ruby-1.9.3-p194

# compile ruby
./configure --prefix=$OPENSHIFT_RUNTIME_DIR
make
make install

export PATH=$OPENSHIFT_RUNTIME_DIR/bin:$PATH

# clean up ruby sources
cd $OPENSHIFT_TMP_DIR
rm -rf ruby*

# install rails
gem install rails --no-ri --no-rdoc

