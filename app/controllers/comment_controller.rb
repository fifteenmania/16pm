class CommentController < ApplicationController
    before_action :authenticate_user!
    
    def create
        comment = Comment.new(comment_params)
        comment.user = current_user
        comment.save
        redirect_back(fallback_location: "/bulletin")
    end
    
    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: "/bulletin") 
    end
    
    private
        def comment_params
           params.permit(:content, :post_id) 
        end
end
