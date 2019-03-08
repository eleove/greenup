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
  username: 'François Touteklean',
  avatar: "myAvatar5.png",
  bio: "Concerné par les problèmes d'environnement, j'ai décidé de rejoindre GreenUp il y a deux mois. J'habite près du lac d'Annecy, et j'essaye de participer aux collectes dans les environs dès que j'en ai l'occasion !"
  )

user2 = User.create!(
  email: 'eleonore.breton@hec.edu',
  password: 'password',
  username: 'Eléonore Breton',
  avatar: "myAvatar3.png",
  bio: "Make Earth great again"
  )


user3 = User.create!(
  email: 'bigcrado@gmail.com',
  password: 'password',
  username: 'Richard Crado',
  avatar: "myAvatar2.png",
  bio: "J'ai beaucoup aimé l'idée de Green Up et j'espère trouver des camarades pour aller ramasser !"
  )

user4 = User.create!(
  email: 'Ginette.paspropre@gmail.com',
  password: 'password',
  username: 'Ginette Paspropre',
  avatar: "myAvatar.png",
  bio: "Concerné par les problèmes d'environnement, j'ai décidé de rejoindre GreenUp il y a deux mois. J'habite près du lac d'Annecy, et j'essaye de participer aux collectes dans les environs dès que j'en ai l'occasion !"
  )


user5 = User.create!(
  email: 'carolinemarie.girard@gmail.com',
  password: 'password',
  username: 'Caroline Girard',
  avatar: "myAvatar4.png",
  bio: "J'habite à Valence et je ramasse des déchets depuis plusieurs années, à très vite sur le terrain !"
  )

location1 = Location.create!(
  name: 'Annecy (au niveau de la vieille Eglise)',
  latitude: 45.899246,
  longitude: 6.129384,
  user: user4,
  garbage: ["Verre", "Emballage et plastique", "Textile"],
  description: 'Ancienne décharge, fermée en 2003. Il y a eu en plus des bulldozers qui sont passés enterrer les déchets. Donc ça réapparaît sans arrêt. Gants obligatoires of course.'
  )

location1.remote_photo_url = 'https://ak8.picdn.net/shutterstock/videos/13446458/thumb/1.jpg?i10c=img.resize(height:160)'
location1.save

location2 = Location.create!(
  name: 'Bois-le-Roi (près du lavoir)',
  latitude: 48.475479,
  longitude: 2.693954,
  user: user4,
  garbage: ["Verre", "Ordures ménagères", "Électroménager"],
  description: 'Début de décharge. Le village en dessous est prêt à filer un coup de main en prêtant 2 camions. La sous-préfette est prévue en fin de soirée.'
  )

location2.remote_photo_url = 'https://ak5.picdn.net/shutterstock/videos/5101895/thumb/1.jpg?i10c=img.resize(height:160)'
location2.save

# location3 = Location.create!(
#   name: 'Massignieu-de-Rives (grange de Scioux)',
#   latitude: 45.899246,
#   longitude: 5.7809804,
#   user: user3,
#   garbage: ["Vêtements", "Métal", "verre"],
#   description: 'Pas de précautions particulières. Les riverains ont commencé le nettoyage il y a 2 mois. Les encombrants sont dégagés.'
#   )

# location3.remote_photo_url = 'https://ak2.picdn.net/shutterstock/videos/9792092/thumb/1.jpg?i10c=img.resize(height:160)'
# location3.save

location4 = Location.create!(
  name: 'Corniche de la Mer Benodet (allée Saint Gildas)',
  latitude: 47.8690904,
  longitude: -4.1018991,
  user: user4,
  garbage: ["Verre", "Emballage et plastique", "Textile", "Ordures ménagères", "Métal"],
  description: 'Ancienne décharge fermée depuis 1972. La mairie a commencé mais le nettoyage traîne. Du plastique évidemment. Il y aura 2 camionnettes. Gants obligatoires of course.'
  )

location4.remote_photo_url = 'https://ak6.picdn.net/shutterstock/videos/32527066/thumb/1.jpg'
location4.save


location5 = Location.create!(
  name: 'Le Riousset Valence (ravin de Catayre)',
  latitude: 44.8642903,
  longitude: 5.0267602,
  user: user3,
  garbage: ["Verre", "Emballage et plastique", "Ordures ménagères", "Métal"],
  description: 'Dès entrée clairière, le terrain est en pente. Arrivez par la route derrière. Le ravin est accessible sans moyens spéciaux. Gants obligatoires of course.'
  )

location5.remote_photo_url = 'https://ak2.picdn.net/shutterstock/videos/9792092/thumb/1.jpg?i10c=img.resize(height:160)'
location5.save

location6 = Location.create!(
  name: 'Croignon près nationale 12',
  latitude: 44.817854,
  longitude: -0.338279,
  user: user1,
  garbage: ["Verre", "Emballage et plastique", "Textile", "Électroménager"],
  description: 'Le long de la nationale. Le ruisseau démarre par un gros caddie. Le tas de déchets est au petit pont derrière. Gants obligatoires of course.'
  )

location6.remote_photo_url = 'https://images.unsplash.com/photo-1542892988-750822de8483?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80'
location6.save

location7 = Location.create!(
  name: 'D620 La Bezole',
  latitude: 43.034017,
  longitude: 2.108823,
  user: user1,
  garbage: ["Verre", "Emballage et plastique", "Textile", "Ordures ménagères", "Éléctroménager"],
  description: 'Terrain vague ouvert aux déchets sauvages depuis 1982. On aura plusieurs groupes qui viendront de la Bezole. Gants obligatoires of course.'
  )

location7.remote_photo_url = 'https://images.unsplash.com/photo-1533869693622-ee25eaf77004?ixlib=rb-1.2.1&auto=format&fit=crop&w=780&q=80'
location7.save


location8 = Location.create!(
  name: 'Charraix, entrée Leclerc',
  latitude: 45.028850,
  longitude: 3.564101,
  user: user1,
  garbage: ["Verre", "Emballage et plastique", "Ordures ménagères", "Déchets industriels"],
  description: 'Entrée Leclerc. Terrain derrière le destockage. Encore des pneus et du plastique. Gants obligatoires of course.'
  )

location8.remote_photo_url = 'https://images.unsplash.com/photo-1530587191325-3db32d826c18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80'
location8.save


location9 = Location.create!(
  name: 'Soulage La valla en Gier',
  latitude: 49.018290,
  longitude: -1.496602,
  user: user1,
  garbage: ["Emballage et plastique", "Textile"],
  description: 'Beaucoup de bouteilles plastiques. Prévoir des gants. Je serai là pour marquer le chantier.'
  )

location9.remote_photo_url = 'https://images.unsplash.com/photo-1531326537431-6197cac3795b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80'
location9.save


# location10 = Location.create!(
#   name: 'Lamby champ fleuri',
#   latitude: 45.798806,
#   longitude: 5.287773,
#   user: user1,
#   garbage: ["Verre", "Textile", "Métal", "Déchets industriels"],
#   description: 'Il y a des anciens fûts essence. Prévoir du matos et une estafette. Gants obligatoires of course.'
#   )

# location10.remote_photo_url = 'https://images.unsplash.com/4/trash-can.jpg?ixlib=rb-1.2.1&auto=format&fit=crop&w=747&q=80'
# location10.save

event1 = Event.create!(
  location: location1, # Annecy
  user: user2, # Eléonore
  schedule: DateTime.new(2019,03,10,10,30)
  )

event2 = Event.create!(
  location: location5, # Valence
  user: user5, # Caro
  schedule: DateTime.new(2019,05,8,14,00)
  )

event3 = Event.create!(
  location: location6, # Croignon Nationale
  user: user5, # Caro
  schedule: DateTime.new(2019,05,8,14,00)
  )

event4 = Event.create!(
  location: location7, # La Bezole
  user: user5, # Caro
  schedule: DateTime.new(2019,05,8,14,00)
  )

# je sais pas pourquoi ça ne créé pas celui-là de base
EventParticipant.create!(
  user: user2,
  event: event1
  )

EventParticipant.create!(
  user: user5,
  event: event1
  )























