set -e
sudo yum update -y

sudo useradd ruby
sudo echo ruby | sudo passwd ruby --stdin

# import rvm key
sudo su - ruby -c 'gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
# user (ruby) rvm install
sudo su - ruby -c '\curl -sSL https://get.rvm.io | bash -s stable'

# ruby deps -- rvm doesn't enable the centosplus package repository and fails
sudo yum --enablerepo=centosplus install -y libyaml-devel glibc-headers autoconf gcc-c++ glibc-devel readline-devel zlib-devel libffi-devel openssl-devel automake libtool bison sqlite-devel
sudo su - ruby -c 'rvm install 2.2.3'
