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
  email: 'frdutheil@hyahoo.fr',
  password: '123456',
  username: 'François Dutheil'
  )

user2 = User.create!(
  email: 'eleonore.breton@hec.edu',
  password: 'password',
  username: 'Eléonore Breton'
  )

user3 = User.create!(
  email: 'momo.latulipe@gmail.com',
  password: '125688',
  username: 'Momo latulipe',
  )

user4 = User.create!(
  email: 'pepe.lemoko@gmail.com',
  password: '3256777',
  username: 'Pepe LeMoko',
  )


user5 = User.create!(
  email: 'carolinemarie.girard@gmail.com',
  password: '579222',
  username: 'Caroline Girard',
  )

Location.create!(
  name: 'Annecy',
  latitude: 45.899246,
  longitude: 6.129384,
  user: user1
  )

Location.create!(
  name: 'Bois-le-Roi',
  latitude: 48.475479,
  longitude: 2.693954,
  user: user2
  )

Location.create!(
  name: 'Massignieu-de-Rives',
  latitude: 45.899246,
  longitude: 5.7809804,
  user: user3
  )

Location.create!(
  name: 'Corniche de la Mer Benodet',
  latitude: 47.8690904,
  longitude: -4.1018991,
  user: user4
  )


Location.create!(
  name: 'Le Riousset Valence',
  latitude: 44.8642903,
  longitude: 5.0267602,
  user: user5
  )
