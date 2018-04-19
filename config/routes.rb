Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  get 'events/edit'

  get 'events/update'

  resources :roles
  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  resources :events
  resources :users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root 'home#index'
end
