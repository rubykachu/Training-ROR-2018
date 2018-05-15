Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'guest/homepage#index'
  get '/hello', to: 'hello_world#index'

  namespace :admin do
    get '/hello', to: 'hello_world#index'

    resources :dashboard, only: :index
  end

  scope module: :guest do
    resources :homepage, only: :index
  end
end