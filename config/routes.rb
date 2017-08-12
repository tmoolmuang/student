Rails.application.routes.draw do
  
  get 'student_courses/show'

  get 'student_courses/new'

  get 'student_courses/edit'

  resources :students do
  	resources :student_courses
  end

  resources :courses

  root 'home#about'
  get 'home/index'

end
