# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# USERS
alexis = User.create(email: 'alexisadorn@gmail.com', password: 'test123', admin: true)
joe = User.create(email: 'joe@gmail.com', password: 'test123')

# STATIONS
currently_watching = Station.create(name: 'Currently Watching', description: 'Shows I\'m currently watching', user: alexis)
to_start = Station.create(name: 'To Start', description: 'Shows I want to start watching', user: alexis)
waiting_for = Station.create(name: 'Waiting', description: 'Shows that are on break', user: alexis)
family_friendly = Station.create(name: 'Family-Friendly', description: 'Shows for the whole family', user: joe)

# GENRES
horror = Genre.create(name: "Horror")
drama = Genre.create(name: "Drama")
comedy = Genre.create(name: "Comedy")
fantasy = Genre.create(name: "Fantasy")
sci_fi = Genre.create(name: "Science Fiction")
adventure = Genre.create(name: "Adventure")

# CHANNELS
amc = Channel.create(name: "AMC")
usa = Channel.create(name: "USA")
hbo = Channel.create(name: "HBO")
netflix = Channel.create(name: "Netflix Original")

# SHOWS
terror = Show.create( title: 'The Terror',
                      description: 'A fictionalized account of Captain Sir John Franklin\'s lost expedition to the Arctic',
                      status: 'Currently On',
                      day: 'Tuesday',
                      time: '8:00 PM',
                      current_season: 1 )
terror.genres << horror
terror.channel = amc
terror.save

mr_robot = Show.create( title: 'Mr. Robot',
                      description: 'A hacker joins a group of hacktivists to destroy all deb records',
                      status: 'On Hiatus',
                      current_season: 3 )
mr_robot.genres << drama
mr_robot.channel = usa
mr_robot.save

got = Show.create( title: 'Game of Thrones',
                      description: 'A fantasty drama series adapted from George R.R. Martin\'s novels',
                      status: 'On Hiatus',
                      current_season: 7 )
got.genres << drama
got.genres << fantasy
got.channel = hbo
got.save

lost_in_space = Show.create( title: 'Lost in Space',
                      description: 'Following the adventures of a family of pioneering space colonists whose ship veers off-course',
                      status: 'On Hiatus',
                      current_season: 1 )
lost_in_space.genres << sci_fi
lost_in_space.genres << adventure
lost_in_space.channel = netflix
lost_in_space.save

# STATION SHOW
station_show1 = StationShow.create(station: currently_watching, show: terror, user: alexis, user_status: 'Currently Watching', user_season: 1)
station_show2 = StationShow.create(station: to_start, show: mr_robot, user: alexis, user_status: "Not Started", user_season: 1)
station_show3 = StationShow.create(station: waiting_for, show: got, user: alexis, user_status: "Caught Up", user_season: 7)
station_show4 = StationShow.create(station: currently_watching, show: lost_in_space, user: alexis, user_status: "Currently Watching", user_season: 1)
station_show2 = StationShow.create(station: family_friendly, show: lost_in_space, user: joe, user_status: "Not Started", user_season: 1)
