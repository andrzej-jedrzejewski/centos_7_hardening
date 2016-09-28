echo 'Ruby installation is starting..........'

apt-get update -y
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev


cd
wget http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar -xzvf ruby-2.2.3.tar.gz
cd ruby-2.2.3/
./configure
make
sudo make install
ruby -v

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

mkdir /home/ubuntu/specserver

cd /home/ubuntu/specserver/

echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'serverspec'" >> Gemfile
echo "gem 'rake'" >> Gemfile

bundle install --path=gems

# mkdir -p /home/ubuntu/

# apt-get install -y git #curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# cd /home/ubuntu/
# git clone https://github.com/sstephenson/rbenv.git /home/ubuntu/.rbenv -v
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/ubuntu/.bashrc
# echo 'eval "$(rbenv init -)"' >> /home/ubuntu/.bashrc
# exec $SHELL

# git clone https://github.com/sstephenson/ruby-build.git /home/ubuntu/.rbenv/plugins/ruby-build -v
# echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/ubuntu/.bashrc
# exec $SHELL

# git clone https://github.com/sstephenson/rbenv-gem-rehash.git /home/ubuntu/.rbenv/plugins/rbenv-gem-rehash -v

# rbenv install 2.2.3
# rbenv global 2.2.3
# ruby -v

# echo "gem: --no-ri --no-rdoc" > /home/ubuntu/.gemrc
# gem install bundler

echo "Ruby installation has finished!"
