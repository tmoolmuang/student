Rails.application.routes.draw do
  
  resources :students 
  resources :courses

  root 'home#about'
  get 'home/index'

end
