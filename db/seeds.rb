User.destroy_all
Plant.destroy_all
UserPlant.destroy_all
CareNote.destroy_all
Comment.destroy_all
Favorite.destroy_all


# u1 = User.create(username: 'emileymarie', password: 'helloworld123' , email: 'emiley@fakemail.com', zone: '10a', experience_level: 4)

# u2 = User.create(username: 'kaileybailey', password: 'helloworld123' , email: 'kailey@fakemail.com', zone: '10a', experience_level: 3)

p1 = Plant.create(name: 'golden pothos', scientific_name: 'SCINDASPUS AUREUS', trefle_api_id: 132809, image_url: 'https://bs.plantnet.org/image/o/d7281e26e4ae96c654c2f5ec4d8b2707ec09cbd3')

# f1 = Favorite.create(user: u1, plant: p1)
# f2 = Favorite.create(user: u2, plant: p1)

# up1 = UserPlant.create(user: u1, plant: p1, name: 'golden girl', difficulty: 1, moisture: 3, indoor: true)

# CareNote.create(user_plant: up1, content: "When she is in the sun her leaves grow with more gold")

# Comment.create(user: u2, user_plant: up1, content: "You look awesome!!")
# https://trefle.io/api/v1/species/search?token=<TOKEN>&q=golden%20pothos