# via
# http://wiki.apache.org/couchdb/Installing_on_Ubuntu

# Installing using an existing package
sudo apt-get install couchdb -y

### Troubleshooting
### If the aptitude/apt-get installation gives an error message then couchdb might not have access to its pid file.
### Fix:
sudo chown -R couchdb /var/run/couchdb

### Need to rerun the setup script:
sudo dpkg --configure couchdb

# Installing from Source on Precise, Quantal, Raring, and Saucy
cd /tmp
wget http://mirror.netcologne.de/apache.org/couchdb/source/1.4.0/apache-couchdb-1.4.0.tar.gz

### make sure you have a couchdb user for the daemon, and couchdb group also
### get developer tools dependencies
sudo apt-get install -y g++
sudo apt-get install -y erlang-dev erlang-manpages erlang-base-hipe erlang-eunit erlang-nox erlang-xmerl erlang-inets
### other packages that are not required but may be useful
# - require GUI packages / X
# sudo apt-get install -y erlang-observer erlang-appmon erlang-debugger erlang-et
# - useful erlang tools to develop with
# sudo apt-get install -y erlang-dialyzer erlang-percept erlang-typer erlang-edoc erlang-os-mon erlang-runtime-tools erlang-inviso erlang-tools

### couchdb developer dependencies
sudo apt-get install -y libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool
### unpack source
cd /tmp && tar xvzf apache-couchdb-1.4.0.tar.gz
cd apache-couchdb-*
./configure && make
### install
sudo make install

### remove leftovers from ubuntu packages
sudo rm /etc/logrotate.d/couchdb /etc/init.d/couchdb

### install logrotate and initd scripts
sudo ln -s /usr/local/etc/logrotate.d/couchdb /etc/logrotate.d/couchdb
sudo ln -s /usr/local/etc/init.d/couchdb  /etc/init.d
sudo update-rc.d couchdb defaults
