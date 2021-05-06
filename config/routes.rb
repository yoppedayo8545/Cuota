Rails.application.routes.draw do
  devise_for :nursing_teachers
  root to: "schools#index"
  resources :schools, only: [:index] do
    collection do
      get 'class_change_one_year'
      
      get 'class_change_second_year'
      
      get 'class_change_third_year'
      
      get 'class_change_fourth_year'
      
      get 'class_change_fifth_year'
      
      get 'class_change_six_year'
      
      post 'reset_one_year'

      post 'reset_second_year'

      post 'reset_third_year'

      post 'reset_fourth_year'

      post 'reset_fifth_year'

      post 'reset_six_year'
    end
  end
  resources :students, only: [:new, :create, :edit, :update ] do
    collection do
      get 'search'

      get 'bulk_new'

      post 'import' 
    end
  end
end
