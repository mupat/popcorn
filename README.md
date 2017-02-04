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
