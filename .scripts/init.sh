apt-get update
#apt-get install -y php php-mysql php-curl php-mbstring php-xml
apt-get install -y firefox-geckodriver

# php setup
export COMPOSER_HOME="$HOME/.config/composer"
composer install

# setup DB
docker-compose -f .scripts/docker-compose.yml up -d

# start PHP web server
.scripts/run.sh &

# wait for DB to start
echo "Sleeping some seconds to let DB start"
sleep 10

# DB initialization
#mysql < .scripts/init-db.sql
mysql -u admin -padmin123 -h 127.0.0.1 < .scripts/world.sql
