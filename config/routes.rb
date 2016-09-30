Rails.application.routes.draw do
    root 'home#index'
    
    get 'intro' => 'home#intro'
    get 'journal' =>'journal#index'
    
    get 'seminar' => 'seminar#index'
    get 'seminar/new' => 'seminar#new'
    post 'seminar/create' => 'seminar#create'
    get 'seminar/view/:id' => 'seminar#show'
    delete 'seminar/:id' => 'seminar#destroy'
    
    get 'bulletin' => 'post#index'
    get 'bulletin/new' => 'post#new'
    post 'bulletin/create' => 'post#create'
    get 'bulletin/view/:id' => 'post#show'
    delete 'seminar/:id' => 'seminar#destroy'
    
    post 'comment/create' => 'comment#create'
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
