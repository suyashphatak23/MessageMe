Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    registration: 'register',
    edit: 'edit/profile'
  }

  resources :users
  resources :messages

  root "messages#index"
end
