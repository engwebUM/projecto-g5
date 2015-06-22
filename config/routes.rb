Rails.application.routes.draw do
	namespace :admin do
		devise_for :users, :controllers => { :sessions => "admin/sessions" }
    resources :users
    resources :plans
    resources :participants
    get '/', to: 'participants#index'
    get '/participants/update_checkin/:id', to: 'participants#update_checkin', as: 'participant_checkin_update'
  end

  resources :participants, only: [:create]
  root to: 'home#index'

end
