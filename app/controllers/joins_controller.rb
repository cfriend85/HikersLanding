class JoinsController < ApplicationController
    def create
    @join = Join.create(user_id:current_user.id, hike_id:params[:id])
    redirect_to '/dashboard'
    end

    def destroy
        @join = Join.find_by(user_id:current_user.id, hike_id: params[:id])
        @join.destroy
        redirect_to '/dashboard'
    end
end
