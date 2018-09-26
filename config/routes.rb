Rails.application.routes.draw do
  get 'producto/index'

  devise_for :users, :skip => [:registrations]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :registros
  # # List all records (registros)
  # get "registros" => "registros#index"

  # # Show one record (registro)
  # get "registros/:id" => "registro#show"

  # # Create a record (registro) - 2 requests
  # get "registros/:new" => "registros#new" #Shows a form
  # post "registros" => "registros#create"

  # # Edit a record (registro) - 2 requests
  # get "registros/:id/edit" => "registros#edit" #Shows a form
  # patch "registros/:id" => "registros#update"

  # # Delete a record (registro)
  # delete "registros/:id" => "registros#destroy"

end
