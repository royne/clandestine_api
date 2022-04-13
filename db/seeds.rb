admin = User.new(username: 'admin', email: 'admin@mail.com', password: '123456')
admin.add_role(:admin)
admin.save!
puts "admin creado"

escort = User.new(username: 'linda', email: 'linda@mail.com', password: '123456')
escort.add_role(:escort)
escort.save!
puts "user escort creado"

Category.create(name: 'Economicas')
Category.create(name: 'A Domicilio')
Category.create(name: 'A hoteles')
Category.create(name: 'Con Lugar')
Category.create(name: '18 años')
Category.create(name: 'Universitarias')
Category.create(name: 'Localidad')
puts "categorias creadas"

Activity.create(name: 'De Lujo')
Activity.create(name: 'Fantasias')
Activity.create(name: 'Juguetes Eroticos')
Activity.create(name: 'Lenceria')
Activity.create(name: 'Oral')
Activity.create(name: 'Todas Las Poses')
Activity.create(name: 'Anal')
puts "servicios creados"

Location.create(name: 'Apartamento privado')
Location.create(name: 'Casa')
Location.create(name: 'Hotel')
Location.create(name: 'Centro de Masajes')
Location.create(name: 'Domicilio')
puts "locaciones creadas"

Escort.create(username: escort.username, first_name: 'juana', last_name: 'gomes', price: 200000, 
              sex: 0, city: 0, age: 25, user_id: escort.id, phone: "3203455443",
              category_ids: [1,2,3], location_ids: [1,2], activity_ids: [1,2]) 
puts "escort creada"
