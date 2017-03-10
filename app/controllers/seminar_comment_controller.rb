class SeminarCommentController < ApplicationController
    def category
        params[:category]
    end
    helper_method :category
    
    def create
        comment = SeminarComment.new(comment_params)
        comment.user = current_user
        comment.save
        redirect_back(fallback_location: "/seminar/#{category}")
    end
    
    def destroy
        comment = SeminarComment.find(params[:id])
        comment.destroy
        redirect_back(fallback_location: "/seminar/#{category}")
    end
    
    private
        def comment_params
           params.permit(:content, :id) 
        end
end
