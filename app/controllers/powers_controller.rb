class PowersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :power_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
    def index 
        power = Power.all 
        render json: power, status: :ok
    end

    def show
        power = find_by_id
        render json: power, status: :ok
    end

    def update
        power = find_by_id
        power.update!(power_params)
        render json: power, status: :accepted
    end


    private
    def find_by_id
        Power.find(params[:id])
        
    end
    def power_params
        params.permit( :name, :description )
    end

    def power_not_found
        render json: { error: "Power not found" }, status: :not_found
        
    end

    def render_record_invalid(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end
