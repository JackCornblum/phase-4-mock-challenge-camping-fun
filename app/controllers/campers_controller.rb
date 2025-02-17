class CampersController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :render_error

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])

        if camper
            render json: camper
        else
            render json: { error: "Camper not found" }, status: :not_found
        end
    end

    def create
        camper = Camper.new(camper_params)

        if camper.save
            render json: camper.without_activities
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    # def render_error(exception)
    #     render json: { error: "Camper not found" }, status: 404
    # end

end
