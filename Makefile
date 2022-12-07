# Configuration
copy-config:
	cp config/database.yml.example config/database.yml

docker-copy-config:
	sed 's/host: localhost/host: db/g' config/database.yml.example > config/database.yml
