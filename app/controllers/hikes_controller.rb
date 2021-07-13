class HikesController < ApplicationController
    def index
        @today = Date.today()
        @future_hikes = Hike.where('hike_date>?', @today)
        @user = User.find(current_user.id)
        @hikes_joined = Hike.all.where.not(user_id:current_user.id)
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
        @today = Date.today()
    end

    def display_guide
    end
    
    def update
        @hike = Hike.find(params[:id])
    end

    def update_hike
        @hike = Hike.find(params[:id])
        @hike.update(hike_params)
        @hike.save
        redirect_to "/show/hike/#{@hike.id}"
    end

    def destroy
        @hike = Hike.find(params[:id])
        @hike.destroy
        redirect_to '/dashboard'
    end

    private
    def hike_params
        params.require(:hike).permit(:description, :trail, :city, :state, :hike_date, :time, :image_url, :user_id)
    end
end
