Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  post '/login', to: 'sessions#create'
  post 'destory', to:'session#destroy'

  get '/users/show'
  
end
