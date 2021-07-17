class SessionsController < ApplicationController
    skip_before_action :require_login
    # Registration
    def new 
        @user = User.create(user_params)
            if @user.valid?
                session[:user_id] = @user.id 
                redirect_to '/dashboard'
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to '/'
            end
        end
    # Login
    def show 
        @user = User.find_by_email(user_params[:email]).try(:authenticate, user_params[:password])
            if @user
                session[:user_id] = @user.id
                redirect_to '/dashboard'
            else
                flash[:login] = ["Account not found"]
                redirect_to '/'
            end
        end

    # Update user form
    def update
        @user = User.find(params[:id])
        @today = Date.today()
        @past_hikes = Hike.all.where(users_joined:@user)
    end
    
    # Actually updating user
    def update_user 
        @user = User.find(params[:id])
        @user.update(user_params)
            if @user.valid?
                @user.save
                redirect_to '/dashboard'
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to "/dashboard"
            end
        end
        
        # Logout
        def destroy
            reset_session
            redirect_to '/'
        end
    
        # Form data
        private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
    end
