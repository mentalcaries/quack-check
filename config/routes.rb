Rails.application.routes.draw do
  root "pages#home"
  get 'about', to: 'pages#about'
  
  resources :dentists, only: [:show, :index]
end
