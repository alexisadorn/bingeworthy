# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alexis = User.create(email: 'alexisadorn@gmail.com', password: 'test123', admin: true)

currently_watching = Station.create(name: 'Currently Watching', description: 'Shows I\'m currently watching', user: alexis)

terror = Show.create( title: 'The Terror',
                      description: 'A fictionalized account of Captain Sir John Franklin\'s lost expedition to the Arctic',
                      genre: 'Horror',
                      channel: 'AMC',
                      status: 'Currently On',
                      day: 'Tuesday',
                      time: '8:00 PM',
                      current_season: 1 )

station_show1 = StationShow.create(station_id: 1, show_id: 1, user_id: 1, user_status: 'Currently Watching', user_season: "1")
