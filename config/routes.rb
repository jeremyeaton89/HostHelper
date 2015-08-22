Rails.application.routes.draw do

  root to: 'builds#index'

  resources :builds
  
end
