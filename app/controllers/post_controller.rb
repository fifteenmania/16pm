class PostController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        post = Post.new(post_params)
        post.user = current_user
        post.save
        unless params[:file].nil?
            photo = Photo.new(photo_params)
            photo.save
            post.photos << photo
        end
        redirect_to "/bulletin"
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
        def post_params
            params.permit(:title, :content)
        end
        
        def photo_params
           params.permit(:file) 
        end
end
