Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:index, :edit, :update, :show]
  resources :vitals, only: [:index, :new, :create]

  resources :foods, only: [:index, :create] do
    collection do
      get  :search
    end
  end

end
