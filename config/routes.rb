Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :discussions do
    resources :posts, only: %i[create show edit update destroy], module: :discussions

    collection do
      get 'category/:id', to: 'categories/discussions#index', as: :category
    end
  end
end
