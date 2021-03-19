Rails.application.routes.draw do
  devise_for :nursing_teachers
  root to: "schools#index"
  resources :schools, only: [:index] 
  resources :students, only: [:new, :create] 
end
