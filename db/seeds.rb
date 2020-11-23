# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat1 = Cat.create(name: "Alfie", breed: "Tabby", age: 3)
colony1 = Colony.create(name: "Greenpoint kitty kastle", borough: "Brooklyn")
colony1.cats.push(cat1)

cat2 = Cat.create(name: "Simba", breed: "Lion", age: 4)
colony2 = Colony.create(name: "Pride Land", borough: "Queens")
colony2.cats.push(cat2)

cat3 = Cat.create(name: "Tom", breed: "Domestic Shorthair", age: 5)
colony3 = Colony.create(name: "MGM Kennel", borough: "Bronx")
colony3.cats.push(cat3)

cat4 = Cat.create(name: "Cheshire", breed: "Tabby British Shorthair", age: 3)
colony4 = Colony.create(name: "Wonderland", borough: "Manhattan")
colony4.cats.push(cat4)

cat5 = Cat.create(name: "Muffy", breed: "Tuxedo", age: 3)
colony5 = Colony.create(name: "Stoughton Kennel", borough: "Long Island")
colony5.cats.push(cat5)