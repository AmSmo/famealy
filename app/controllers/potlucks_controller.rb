class PotlucksController < ApplicationController
    skip_before_action :authorized

    def index
        @potlucks = Potluck.all
        render json: @potlucks
    end
end
