# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
User.destroy_all

user1 = User.create!(
  email: 'frdutheil@yahoo.fr',
  password: 'password',
  username: 'François Dutheil',
  points: 12,
  avatar: "myAvatar5.png"
  )

user2 = User.create!(
  email: 'eleonore.breton@hec.edu',
  password: 'password',
  username: 'Eléonore Breton',
  points: 252,
  avatar: "myAvatar3.png"
  )


user3 = User.create!(
  email: 'bigcrado@gmail.com',
  password: '125688',
  username: 'Richard Crado',
  points: 3,
  avatar: "myAvatar2.png"
  )

user4 = User.create!(
  email: 'Ginette.paspropre@gmail.com',
  password: 'password',
  username: 'Ginette Paspropre',
  points: 2,
  avatar: "myAvatar.png"
  )


user5 = User.create!(
  email: 'carolinemarie.girard@gmail.com',
  password: '579222',
  username: 'Caroline Girard',
  points: 253,
  avatar: "myAvatar4.png"
  )

location1 = Location.create!(
  name: 'Annecy (au niveau de la vieille Eglise)',
  latitude: 45.899246,
  longitude: 6.129384,
  user: user4
  )

location1.remote_photo_url = 'https://ak8.picdn.net/shutterstock/videos/13446458/thumb/1.jpg?i10c=img.resize(height:160)'
location1.save

location2 = Location.create!(
  name: 'Bois-le-Roi (près du lavoir)',
  latitude: 48.475479,
  longitude: 2.693954,
  user: user4
  )

location2.remote_photo_url = 'https://ak5.picdn.net/shutterstock/videos/5101895/thumb/1.jpg?i10c=img.resize(height:160)'
location2.save

location3 = Location.create!(
  name: 'Massignieu-de-Rives (grange de Scioux)',
  latitude: 45.899246,
  longitude: 5.7809804,
  user: user3
  )

location3.remote_photo_url = 'https://ak2.picdn.net/shutterstock/videos/9792092/thumb/1.jpg?i10c=img.resize(height:160)'
location3.save

location4 = Location.create!(
  name: 'Corniche de la Mer Benodet (allée Saint Gildas)',
  latitude: 47.8690904,
  longitude: -4.1018991,
  user: user4
  )

location4.remote_photo_url = 'https://ak6.picdn.net/shutterstock/videos/32527066/thumb/1.jpg'
location4.save

location5 = Location.create!(
  name: 'Le Riousset Valence (ravin de Catayre)',
  latitude: 44.8642903,
  longitude: 5.0267602,
  user: user3
  )

location5.remote_photo_url = 'https://ak2.picdn.net/shutterstock/videos/9792092/thumb/1.jpg?i10c=img.resize(height:160)'
location5.save
