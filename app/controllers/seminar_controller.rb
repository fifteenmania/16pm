class SeminarController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create]
    
    def category
        params[:category]
    end
    helper_method :category
    
    def index
        @seminars = Seminar.where(category: category)
    end
    
    def create
        seminar = Seminar.new(seminar_params)
        seminar.category = category
        seminar.save
        redirect_to "/seminar/#{category}"
    end
    
    def edit
        @seminar = Seminar.find(params[:id])
    end
    
    def update
        seminar = Seminar.find(params[:id])
        seminar.update(seminar_params)
        redirect_to "/seminar/#{category}/view/#{params[:id]}"
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
            params.permit(:title, :speecher, :date, :content, :attachment)
        end
        
        def photo_params
           params.permit(:file) 
        end
end
