yes | sudo apt update


yes | sudo apt-get install -y build-essential
yes | sudo apt-get install -y erlang-base erlang-dev erlang-nox erlang-unit
yes | sudo apt-get install -y libmozjs185-dev libicu-dev libcurl4-gnutls-dev libtool

sudo mkdir -p /usr/local/src
sudo chmod 777 /usr/local/src

stat /usr/local/src/couchdb.tar.gz || curl https://apache.claz.org/couchdb/source/3.1.1/apache-couchdb-3.1.1.tar.gz -o /usr/local/src/couchdb.tar.gz

sudo mkdir -p /usr/local/src/couchdb
sudo chmod 777 /usr/local/src/couchdb

tar xvzf /usr/local/src/couchdb.tar.gz --strip-components 1 -C /usr/local/src/couchdb

cp -a /src/couchdb/couchdb.config /usr/local/src/couchdb/rel

cd /usr/local/src/couchdb && ./configure && make

alias couchdb='/usr/local/src/couchdb/rel/couchdb/bin/couchdb'

sudo mkdir -p /opt/couchdb/etc
sudo chmod -777 /opt/couchdb/etc

sudo cp -a ~/src/couchdb/local.ini /usr/local/src/couchdb/etc/local.ini


