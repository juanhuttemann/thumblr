Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  authenticated :user do
    root 'posts#index', as: 'authenticated_root'
  end

  root 'welcome#index'
  resources :posts
end
