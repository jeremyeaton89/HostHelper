Rails.application.routes.draw do

  root to: 'builds#index'

  resources :builds

  get '/builds/:id/xml', to: 'builds#show_xml'
  
end
