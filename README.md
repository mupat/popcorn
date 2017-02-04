# Popcorn
Simple webapp to administrate movie collections.

## Get up and running

The easiest way is to use it with docker and the provided makefile

```
make build
make bundle
make db
make run
```

NOTE: The default dockerfile is not production ready!

## Database
This app concentrates on the core facts for a movie with related actors and the producer. Pictures to the movies are also attachable.

## Future Improvements/Development
* production ready docker
* more details for movies
* add genres to categorize movies
* add a real user rating
* get informations from third party api's like IMDB
