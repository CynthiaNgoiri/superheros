class HeroPowersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    def create
        hp = HeroPower.create!(params_hp)
        render json: hp.hero, status: :created
    end


    private
    def params_hp
        params.permit(:strength, :power_id, :hero_id )
        
    end

    def render_record_invalid(e)
        render json: { error: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
