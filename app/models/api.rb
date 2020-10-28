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
end
