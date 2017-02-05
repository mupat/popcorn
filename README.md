# Popcorn
Simple webapp to administrate a movie collection.

[![CircleCI](https://circleci.com/gh/mupat/popcorn/tree/master.svg?style=shield)](https://circleci.com/gh/mupat/popcorn/tree/master)
[![codecov](https://codecov.io/gh/mupat/popcorn/branch/master/graph/badge.svg)](https://codecov.io/gh/mupat/popcorn)

## Get up and running

The easiest way is to use it with docker and the provided makefile

```
make build
make bundle
make db
make run
```

NOTE: The default dockerfile is for development purpose only!

Also possible to use the classic way for rails development

```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s -b 0.0.0.0
```

## Database
This app concentrates on the core facts for a movie with related actors and the producer. Pictures to the movies are also attachable. See [model diagram](doc/models_complete.png)
[![model](doc/models_complete.png)](doc/models_complete.png)

## Future Improvements/Development
* [x] production ready docker
* allow to add more pictures in a row
* more details for movies
* add genres to categorize movies
* add user rating
* add cover image for movies
* get informations from third party api's like IMDB
* allow adding of persons for actors and developers directly from UI
* add show pages per movie
* add integration tests
