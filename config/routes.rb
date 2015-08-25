Rails.application.routes.draw do

  root to: 'builds#index'

  resources :builds, only: [:create, :index, :new]

  get '/builds/:id/xml', to: 'builds#show_xml'
  
end
