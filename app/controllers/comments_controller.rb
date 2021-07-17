class CommentsController < ApplicationController
    before_action :require_login
    
    # Create a user comment on a specific hike
    def create
        @hike = Hike.find(params[:id])
        @comment = Comment.create(content: comment_params[:content], user_id: current_user.id, hike_id: @hike.id)
        if @comment
            redirect_to "/show/hike/#{@hike.id}"
        else
            flash[:errors] = @comment.errors.full_messages
            redirect_to "/show/hike/#{@hike.id}"
        end
    end
    
    # Comment form data
    private
    def comment_params
        params.require(:comment).permit(:content)
    end
end
