Rails.application.routes.draw do
  
  devise_for :users

  resources :students do
  	resources :student_courses
  end
	
	resources :courses
  
	namespace 'api' do
    namespace 'v1' do
      resources :students do
        resources :student_courses
      end
      resources :courses
      get 'records', to: 'student_courses#index'
    end
  end

  root 'home#about'
  get 'home/index', to: 'student_courses#index'

end
