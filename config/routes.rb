Rails.application.routes.draw do
  devise_for :user, :skip => [:sessions], :controllers => { :registrations => "user/registrations" }
  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  root 'home#index'
  
  get 'intro' => 'home#intro'
  get 'journal' =>'journal#index'
  
  get 'seminar/:category' => 'seminar#index'
  get 'seminar/:category/new' => 'seminar#new'
  post 'seminar/:category/create' => 'seminar#create'
  get 'seminar/:category/view/:id' => 'seminar#show'
  get 'seminar/:category/destroy/:id' => 'seminar#destroy'
  
  get 'bulletin' => 'post#index'
  get 'bulletin/new' => 'post#new'
  post 'bulletin/create' => 'post#create'
  get 'bulletin/view/:id' => 'post#show'
  get 'seminar/destroy/:id' => 'seminar#destroy'
  
  post 'comment/create' => 'comment#create'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
