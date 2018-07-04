Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root 'posts#index'
  resources :posts
  root to: "home#index"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
