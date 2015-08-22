Rails.application.routes.draw do

  root to: 'builds#index'

  resources :builds

  get '/builds/:slug/xml', to: 'builds#show_xml'
  
end
