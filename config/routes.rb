Rails.application.routes.draw do
	scope :admin do
    devise_for :users
    resources :users 
    resources :users_admin, :controller => 'users'
    resources :participants
    get '/', to: 'participants#index'
  end
  # get '/admin', to: 'participants#index'
  root to: 'home#index'
end
