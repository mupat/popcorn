ford = Person.find_or_create_by({first_name: 'Harrison', last_name: 'Ford'})
hamill = Person.find_or_create_by({first_name: 'Mark', last_name: 'Hamill'})
abrams = Person.find_or_create_by({first_name: 'J.J.', last_name: 'Abrams'})
spielberg = Person.find_or_create_by({first_name: 'Steven', last_name: 'Spielberg'})

################################################################################
# create first movie
################################################################################
star_wars = Movie.find_or_initialize_by({
  title: 'Star Wars: Episode VII - The Force Awakens',
  summary: 'Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy and only a ragtag group of heroes can stop them, along with the help of the Resistance.'
})

star_wars.actors = [
  Actor.find_or_create_by(person: ford, movie: star_wars),
  Actor.find_or_create_by(person: hamill, movie: star_wars)
]
star_wars.director = Director.find_or_create_by(person: abrams, movie: star_wars)

if star_wars.pictures.count == 0
  star_wars.pictures = [Picture.create(remote_file_url: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc5Nzc2OTk2OF5BMl5BanBnXkFtZTgwMDU0Nzg0NzE@._V1_.jpg', picturable: star_wars)]
end
star_wars.save!

################################################################################
# create second movie
################################################################################
jones = Movie.find_or_initialize_by({
  title: 'Indiana Jones and the Kingdom of the Crystal Skull',
  summary: 'Famed archaeologist/adventurer Dr. Henry "Indiana" Jones is called back into action when he becomes entangled in a Soviet plot to uncover the secret behind mysterious artifacts known as the Crystal Skulls.'
})

jones.actors = [
  Actor.find_or_create_by(person: ford, movie: jones)
]
jones.director = Director.find_or_create_by(person: spielberg, movie: jones)

if jones.pictures.count == 0
  jones.pictures = [Picture.create(remote_file_url: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTI4OTgxMjQzMV5BMl5BanBnXkFtZTYwMTcwODc4._V1_.jpg', picturable: jones), Picture.create(remote_file_url: 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTMyOTg0MjY2Ml5BMl5BanBnXkFtZTcwODcwMjE3MQ@@._V1_SY1000_CR0,0,1459,1000_AL_.jpg', picturable: jones)]
end
jones.save!
