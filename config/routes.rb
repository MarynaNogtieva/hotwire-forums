Rails.application.routes.draw do
  devise_for :users
  root to: "main#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :discussions do
    resources :posts, only: %i[create show edit update], module: :discussions
  end

end
