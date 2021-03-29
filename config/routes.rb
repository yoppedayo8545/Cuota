Rails.application.routes.draw do
  devise_for :nursing_teachers
  root to: "schools#index"
  resources :schools, only: [:index] do
    collection do
      get 'class_change'
    end
  resources :students, only: [:new, :create, :edit, :update ] do
    collection do
      get 'search'
    end
  end
end
