Rails.application.routes.draw do
  
  devise_for :users
  resources :students do
  	resources :student_courses
  end

  resources :courses

  root 'home#about'
  get 'home/index', to: 'student_courses#index'

end
