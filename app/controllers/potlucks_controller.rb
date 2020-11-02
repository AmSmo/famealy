class PotlucksController < ApplicationController
    skip_before_action :authorized

    def index
        my_potlucks = current_user.potlucks
        friends_potlucks = current_user.friends.map(&:potlucks).select{|val| val != []}
        fixed = friends_potlucks.map do |friends|
            friends.reject do |potluck|
                my_potlucks.include?(potluck)
            end
        end.flatten
        if !fixed
            fixed = []
        end
        
        render json: {my_potlucks: my_potlucks, friends_potlucks:fixed }
    end

    def show
        current_potluck = Potluck.find_by(id: params[:id])
        render json: current_potluck
    end
end
