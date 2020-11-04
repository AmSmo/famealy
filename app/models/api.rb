class Api < ApplicationRecord

    def self.api_call(url)        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = ENV['SPOON_HOST']
        request["x-rapidapi-key"] = ENV['SPOON_KEY']

        response = http.request(request)
        JSON.parse(response.read_body)
    end

    def self.convert(details)
        url = URI("https://rapidapi.p.rapidapi.com/recipes/convert?ingredientName=#{details[:ingredient]}&targetUnit=#{details[:toType]}&sourceUnit=#{details[:fromType]}&sourceAmount=#{details[:amount]}")
        Api.api_call(url)
    end


    def self.random
        url = URI("https://rapidapi.p.rapidapi.com/recipes/random?number=1")
        recipe = Api.api_call(url)["recipes"][0]
        manipulated_recipe = {
            name: recipe["title"],
            spoon_id: recipe["id"].to_i,
            image_url: recipe["image"]
        }
    end

    def self.api_ingredient_info(ingredient)
        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/parseIngredients") 
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Post.new(url)
        request["x-rapidapi-host"] = ENV['SPOON_HOST']
        request["x-rapidapi-key"] = ENV['SPOON_KEY']
        request["content-type"] = 'application/x-www-form-urlencoded'
        request.body = "ingredientList=#{ingredient}"
        response = http.request(request)
        JSON.parse(response.read_body)
    end


    def self.recipe_search(recipe)
        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=#{recipe}&number=100")
        found_recipes = api_call(url)
        choices = found_recipes["results"]
    end


    def self.recipe_detail(spoon_id)
        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{spoon_id}/information")
        recipe = api_call(url)
        begin
            directions = recipe['analyzedInstructions'][0]['steps']
        rescue
            directions = [{'number'=> 1, 'step'=> "NO INSTRUCTIONS PROVIDED"}]
        end
        directions = directions.map do |direction|
            {step: direction["number"], details: direction["step"]}
        end
        
        manipulated_recipe = {
            name: recipe["title"],
            spoon_id: spoon_id.to_i,
            description: Nokogiri::HTML::Document.parse(recipe["summary"]).text,
            time: recipe["readyInMinutes"],
            cost: (recipe["pricePerServing"]/100.0 * recipe["servings"]  + 0.20).round(2),
            directions_json: directions,
            directions: recipe["instructions"],
            ingredients: recipe["extendedIngredients"],
            image_url: recipe["image"]
        }
    end

    def self.ingredient_search(ingredient_keyword)
        result = Api.api_ingredient_info(ingredient_keyword)
    end
end
