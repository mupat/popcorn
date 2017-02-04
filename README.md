# Popcorn
Simple webapp to administrate movie collections.

## Get up and running

The easiest way is to use it with docker

```
docker build -t popcorn .
docker run -v `pwd`:/app -it popcorn rake db:migrate
docker run -p '3000:3000' -v `pwd`:/app -it popcorn
```

NOTE: The current dockerfile is not production ready!

Or the classic way
```
bundle install
rake db:migrate
```

## Database
This app concentrates on the core facts for a movie with related actors and the producer. Pictures to the movies are also attachable.

## Future Improvements/Development
* production ready docker
* more details for movies
* add genres to categorize movies
* add a real user rating
* get informations from third party api's like IMDB
