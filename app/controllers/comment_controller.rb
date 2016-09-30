class CommentController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        comment.save
        redirect_back(fallback_location: "/bulletin")
    end
    
    private
        def comment_params
           params.permit(:content, :post_id) 
        end
end
