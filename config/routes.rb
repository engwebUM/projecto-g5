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
    get '/participants/update_checkin/:id', to: 'participants#update_checkin', as: 'participant_checkin_update'
    get '/participants/update_kit/:id', to: 'participants#update_kit', as: 'participant_kit_update'
    get '/participants/update_paid/:id', to: 'participants#update_paid', as: 'participant_paid_update'
    get '/participants/update_credentials/:id', to: 'participants#update_credentials', as: 'participant_credentials_update'
  end
  get '/credentials/create' => 'credentials#create', as: 'credential_create'
  resources :participants, only: [:create]
  root to: 'home#index'
end
