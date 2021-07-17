class JoinsController < ApplicationController
    before_action :require_login

    # Join function for user to join hike
    def create
        @join = Join.find_by(user_id: current_user.id, hike_id: params[:id])
            if @join
                redirect_to :back
            else
                @join = Join.create(user_id:current_user.id, hike_id:params[:id])
                redirect_to :back
            end
    end
    
    # Destroy for the user join
    def destroy
        @join = Join.find_by(user_id:current_user.id, hike_id: params[:id])
        @join.destroy
        redirect_to '/dashboard'
    end
end
