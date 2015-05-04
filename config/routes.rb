Rails.application.routes.draw do
	scope :admin do
    devise_for :users
    resources :users 
    resources :users_admin, :controller => 'users'
    resources :participants
    get '/', to: 'participants#index'
  end
  root to: 'home#index'
end
