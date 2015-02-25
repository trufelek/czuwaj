# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.delete_all
r1 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})
r2 = Role.create({name: "Coordinator", description: "Can read items"})
r3 = Role.create({name: "Client", description: "Can read items"})


User.delete_all
u1 = User.create({name: "Admin", email: "admin@mail.com", password: "adminadmin", password_confirmation: "adminadmin", role_id: r1.id})
u2 = User.create({name: "Koordynator", email: "koordynator@mail.com", password: "koordynator", password_confirmation: "koordynator", role_id: r2.id})
u3 = User.create({name: "Klient", email: "klient@mail.com", password: "klientklient", password_confirmation: "klientklient", role_id: r3.id})

 