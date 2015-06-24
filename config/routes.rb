Rails.application.routes.draw do
	namespace :admin do
		devise_for :users, :controllers => { :sessions => "admin/sessions" }
    resources :users
    resources :plans
    resources :participants
    get '/', to: 'participants#index'
  end
  resources :participants, only: [:create]
  root to: 'home#index'

end
