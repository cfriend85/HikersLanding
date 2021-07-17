class HikesController < ApplicationController
    before_action :require_login

    # Dashboard page shown after successful registration or login
    def index
        @today = Date.today()
        @future_hikes = Hike.where('hike_date>?', @today)
        @user = User.find(current_user.id)
        @hikes_joined = Hike.all.where.not(user_id:current_user.id)
    end
    
    # Process hike form data
    def create
        @hike = Hike.create(hike_params)
            if @hike.valid?
                join = Join.create(user_id:current_user.id, hike_id: @hike.id)
                redirect_to "/show/hike/#{@hike.id}"
            else
                flash[:errors] = @hike.errors.full_messages
                redirect_to '/dashboard'
            end
    end
    
    # Show page for hikes
    def show
        @today = Date.today()
        @hike = Hike.find(params[:id])
        @comments = Comment.where(hike_id: @hike.id)
    end
    
    # Show page for users to find hikes to join
    def show_hikes
        @hikes = Hike.where.not(users_joined:current_user.id)
        @today = Date.today()
    end

    # Displays hikers guide
    def display_guide
    end
    
    # Form to update hike
    def update
        @hike = Hike.find(params[:id])
    end

    # Process to actually update the hike
    def update_hike
        @hike = Hike.find(params[:id])
        @hike.update(hike_params)
            if @hike.valid?
                @hike.save
                redirect_to "/show/hike/#{@hike.id}"
            else
                flash[:errors] = @hike.errors.full_messages
                redirect_to "/edit/#{@hike.id}"
            end
    end
    
    # Delete hike
    def destroy
        @hike = Hike.find(params[:id])
        @hike.destroy
        redirect_to '/dashboard'
    end
    
    # Hike form data
    private
    def hike_params
        params.require(:hike).permit(:description, :trail, :city, :state, :hike_date, :time, :image_url, :user_id)
    end
end
