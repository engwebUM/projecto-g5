Rails.application.routes.draw do
	scope :admin do
    devise_for :users 
    resources :participants
    get '/', to: 'participants#index'
  end
  # get '/admin', to: 'participants#index'
  root to: 'home#index'
end
