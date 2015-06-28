Rails.application.routes.draw do
	namespace :admin do
		devise_for :users, :controllers => { :sessions => "admin/sessions" }
    resources :users
    resources :plans
    resources :participants do
      collection do
        get :generate_credentials
      end
    end
    get '/', to: 'participants#index'
    get '/participants/update_field/:id', to: 'participants#update_field', as: 'participant_field_update'
  end
  resources :participants, only: [:create]
  root to: 'home#index'
end
