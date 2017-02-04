PROJECT = mupat/popcorn
RAILS_ROOT = /popcorn
PORT = 3000
DOCKER = docker run --rm -it -v $(PWD):$(RAILS_ROOT)
DOCKER_PROJECT = $(DOCKER) $(PROJECT)

build:
	docker build -t $(PROJECT) .

bundle:
	$(DOCKER_PROJECT) bundle install

run:
	$(DOCKER) -p $(PORT):$(PORT) $(PROJECT)

db:
	$(DOCKER_PROJECT) rake db:create
	$(DOCKER_PROJECT) rake db:migrate
	$(DOCKER_PROJECT) rake db:seed

exec:
	$(DOCKER_PROJECT) ${CMD}
