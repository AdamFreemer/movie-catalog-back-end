# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.create!(
  title: "Guardians of the Galaxy Vol. 2",
  director:	"James Gunn",
  actors: "Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel",
  imdb_id: "tt3896198",
  year:	"2017",
  rated:	"PG-13",
  runtime: "136 min",
  genre: "Action, Adventure, Comedy, Sci-Fi",
  plot: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father the ambitious celestial being Ego.",
  poster_url:	"https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg"
)
