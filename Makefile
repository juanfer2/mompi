# Configuration
copy-config:
	cp config/database.example.yml config/database.yml
	cp config/credentials.example.yml config/credentials.yml

docker-copy-config:
	sed 's/host: localhost/host: db/g' config/database.example.yml > config/database.yml
	sed 's/host: localhost/host: db/g' config/credentials.example.yml > config/credentials.yml
