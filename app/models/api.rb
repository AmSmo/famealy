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
            spoon_id: spoon_id.to_i,
            description: Nokogiri::HTML::Document.parse(recipe["summary"]).text,
            time: recipe["readyInMinutes"],
            price: (recipe["pricePerServing"]/100.0 * 4).round(2),
            directions_json: directions,
            directions: recipe["instructions"],
            ingredients: recipe["extendedIngredients"]
        }
    end
end
