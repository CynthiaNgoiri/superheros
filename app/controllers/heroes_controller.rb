class HeroesController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound, with: :hero_not_found

    def index 
        hero = Hero.all
        render json: hero, status: :ok, each_serializer: HeroIndexSerializer
    end 

    def show
        hero = Hero.find(params[:id])
        render json: hero, status: :ok
    end


    private
     def hero_not_found
        render json: { error: "Hero not found" }, status: :not_found
     end
end
