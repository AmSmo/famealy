# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# UserUser.destroy_all
# User.destroy_all
# RecipeIngredient.destroy_all
# PotluckRecipe.destroy_all
# Ingredient.destroy_all
# Recipe.destroy_all
# Potluck.destroy_all

# adam = User.create(name: "Adam", username: "Mo", location: "Queens", password: "123", email_address:"mo@mo.com")

# friends = UserUser.create(user: adam, friend: bob)
# friends = UserUser.create(user: bob, friend: adam)

# kale = Ingredient.create(name: "Kale", spoon_id: 45)
# ribs = Ingredient.create(name: "Ribs", spoon_id: 47)

# delicious = Recipe.create(name: "KaleRibs", spoon_id: 49, description: "You know Kale with Ribs", time: 45, price: 4.70, directions: "Heat and eat")
# kale_delicious = RecipeIngredient.create(recipe: delicious, ingredient: kale, amount: 2, amount_type: "bunches")
# ribs_delicious = RecipeIngredient.create(recipe: delicious, ingredient: ribs, amount: 12, amount_type: "ribs")
# adam_delicious = UserRecipe.create(user: adam, recipe: delicious, rating: 3, review: "needs more kale")
# bob_luck  = UserPotluck.create(user:bob, potluck: bday)
# kale_luck = PotluckRecipe.create(recipe:delicious, potluck: bday, time:"12:00pm")
# bob_kale = UserIngredient.create(user: bob, ingredient: kale, amount:2, amount_type: "bunches")
# bob_kale_luck = SuppliedIngredient.create(ingredient: kale, potluck: bday, quantity: 1, user_ingredient: bob_kale.id)

# outerbanks = Trip.create(name: "OBX", location: "NC", start_date:"10-22-2020", end_date: "10-27-2020")

# TripPotluck.create(potluck: bday, trip: outerbanks)

# bday = Potluck.create(name:"Bday Party", location: "Outerbanks", date:"11-02-2020")


# bob = User.create(name: "Bob", username: "BobOMite", location: "Jersey", password: "123", email_address:"bob@bob.com")


require 'faker'
8.times do 
    potluck =Potluck.create(name: Faker::TvShows::Simpsons.location ,date: Faker::Date.between(from: '2020-11-23', to: '2021-09-25'), location: Faker::Address.city )
end

30.times do 
    user =User.create(name: Faker::Name.name, email_address: Faker::Internet.email, username: Faker::Games::Pokemon.name, location: Faker::Address.city, password: "123"  )
    3.times do
        UserRecipe.create(user: user, recipe: Recipe.order('RANDOM()').first)
    end
    3.times do 
        second_user = User.order('RANDOM()').first
        UserUser.create(user: user, friend: second_user)
        UserUser.create(friend: user, user: second_user)
    end
    2.times do
        potluck = UserPotluck.create(user: user, potluck: Potluck.order('RANDOM()').first)
        
    end
    
    2.times do
        PotluckRecipe.create(user: user, recipe: user.recipes.sample, potluck: user.potlucks.sample)
    end
    
    
end
