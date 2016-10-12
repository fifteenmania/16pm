class SeminarController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create]
    
    def category
        params[:category]
    end
    helper_method :category
    
    def index
        @seminars = Seminar.where(category: category)
    end
    
    def new
        
    end
    
    def create
        seminar = Seminar.new(seminar_params)
        seminar.category = category
        seminar.save
        unless params[:file].nil?
            photo = Photo.new(photo_params)
            photo.save
            seminar.photos << photo
        end
        redirect_to "/seminar/#{category}"
    end
    
    def show
        @seminar = Seminar.find(params[:id])
    end
    
    def destroy
        @seminar = Seminar.find(params[:id])
        @seminar.destroy
        redirect_to "/seminar/#{category}"
    end
    
    private
        def seminar_params
            params.permit(:title, :speecher, :date, :content)
        end
        
        def photo_params
           params.permit(:file) 
        end
end
