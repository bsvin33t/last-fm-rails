Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root :to => 'users#show', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')

  resource :user, only: [:show]
  post 'search' => 'search#create'
  get 'search' => 'search#show'
end
