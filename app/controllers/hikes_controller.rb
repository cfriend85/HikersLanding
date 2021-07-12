class HikesController < ApplicationController
    def index
        @hikes = Hike.where(user_id:current_user.id)
        @user = User.find(current_user.id)
    end

    def create
    hike = Hike.create(hike_params)
    join = Join.create(user_id:current_user.id, hike_id:hike.id)
    redirect_to '/dashboard'
    end

    def show
        @hike = Hike.find(params[:id])
    end

    def show_hikes
        @hikes = Hike.where.not(users_joined:current_user.id)
    end

    private
    def hike_params
        params.require(:hike).permit(:description, :trail, :city, :state, :hike_date, :time, :image_url, :user_id)
    end
end
