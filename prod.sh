#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get install -y apache2

if ! [ -L /var/www  ]; then
  sudo rm -rf /var/www
  sudo ln -fs /vagrant /var/www
fi

sudo apt-get -y update

sudo apt-get -y install postgresql postgresql-contrib autoconf bison git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libncurses5-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libgdbm3 libgdbm-dev vim<<EOF
Y
EOF

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo -H -u vagrant bash -i -c 'rbenv install 2.3.0'
sudo -H -u vagrant bash -i -c 'rbenv global 2.3.0'

sudo -H -u vagrant bash -i -c 'gem install rails -V --no-ri --no-rdoc'
sudo -H -u vagrant bash -i -c 'gem install bundler -V --no-ri --no-rdoc'
