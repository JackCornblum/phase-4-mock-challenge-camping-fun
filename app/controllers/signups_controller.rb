class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        # byebug

        if signup.valid?
            render json: signup.activity
        else
            render json: { errors: ["validation error"] }, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.require(:signup).permit(:time, :camper_id, :activity_id)
    end

end
