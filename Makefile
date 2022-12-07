# Configuration
copy-config:
	cp config/database.example.yml config/database.yml

docker-copy-config:
	sed 's/host: localhost/host: db/g' config/database.example.yml > config/database.yml
