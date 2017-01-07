# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(rol: 0, username: 'admin', email: 'admin@emp.com', hashed_password: 'admin')
User.create(rol: 1, username: 'empleado', email: 'empleado@emp.com', hashed_password: 'empleado')
User.create(rol: 2, username: 'cliente', email: 'cliente@emp.com', hashed_password: 'cliente')

Profile.create(name: 'Juan Daniel', age: 26, address: 'Perdido en el culo del mundo :)', phone: 645312978, user_id: 1)
Profile.create(name: 'Christo', age: 28, address: 'Donde no hace frio', phone: 645312978, user_id: 2)
Profile.create(name: 'Casual', age: 36, address: 'Vaya usted a saber', phone: 645312978, user_id: 3)

Dish.create(name: 'Pan con Ajo', allergens: 'Gluten', description: 'Pan con ajos', category: 'Entrantes', image: "plato1.png", price: 2.5, active: 1)
Dish.create(name: 'Papas Arrgugadas', allergens: 'Apio', description: 'Papas arrugadas con mojo picon', category: 'Entrante', image: "plato1.png", price: 3.0, active: 1)
Dish.create(name: 'Gambas al Ajillo', allergens: 'Marisco', description: 'Gambas al Ajillo', category: 'Entrante', price: 4.5, image: "plato2.png", active: 1)
Dish.create(name: 'Sopa de Pollo', allergens: 'Gluten,Apio', description: 'Sopa casera', category: 'Primeros', price: 5, image: "plato3.png", active: 1)
Dish.create(name: 'Sopa de Marisco', allergens: 'Gluten,Apio', description: 'Sopa casera', category: 'Primeros', price: 5.5, image: "plato1.png", active: 1)
Dish.create(name: 'Sopa Jardinera', allergens: 'Gluten,Apio', description: 'Sopa casera', category: 'Primeros', price: 5, image: "plato2.png", active: 1)
Dish.create(name: 'Pollo a la Plancha', allergens: '', description: 'Pollo a la plancha con salsa de curry', category: 'Segundos', price: 6, image: "plato3.png", active: 1)
Dish.create(name: 'Vueltas a la Casera', allergens: '', description: 'Vueltas a la casera', category: 'Segundos', price: 6.5, image: "plato1.png", active: 1)
Dish.create(name: 'Chuletas de Cordero', allergens: '', description: 'Chuletas de Cordero a la brasa', category: 'Segundos', price: 7, image: "plato2.png", active: 1)
Dish.create(name: 'Helado de Vainilla', allergens: 'Leche,Huevo', description: 'Helado casero', category: 'Postres', price: 2.5, image: "plato3.png", active: 1)
Dish.create(name: 'Helado de Fresa', allergens: 'Leche,Huevo', description: 'Helado casero', category: 'Postres', price: 2.5, image: "plato1.png", active: 1)
Dish.create(name: 'Helado de Chocolate', allergens: 'Leche,Huevo', description: 'Helado casero', category: 'Postres', price: 2.5, image: "plato2.png", active: 1)
Dish.create(name: 'NO ACTIVO', allergens: 'NO ACTIVO', description: 'NO ACTIVO', category: 'NO ACTIVO', price: 2.5, image: "plato3.png", active: 0)

Restaurant.create(name: 'COC-Maspalomas', location: '', description: '', phone: '', address: '', provincia: 'Las Palmas', localidad: 'Maspalomas')
Restaurant.create(name: 'COC-San Mateo', location: '', description: '', phone: '', address: '', provincia: 'Las Palmas', localidad: 'San Mateo')
Restaurant.create(name: 'COC-La Laguna', location: '', description: '', phone: '', address: '', provincia: 'Santa Cruz de Tenerife', localidad: 'La Laguna')

