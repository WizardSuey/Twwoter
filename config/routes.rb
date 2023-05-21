Rails.application.routes.draw do
  resources :likes
  get 'comments/new'
  get 'comments/show'
  get 'users/index'
  # GET /about
  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"
  
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"  

  resources :tweets
  post "tweets/new", to: "tweets#create"
  patch "tweets/:id/edit", to: "tweets#update"
  delete "tweets/:id/edit", to: "tweets#destroy"

  resources :posts
  
  get "user/:id", to: "users#show", as: :user
  post "posts/new", to: "posts#create"
  root to: "main#index"

  resources :posts do
    resources :comments, only: [:create]
  end
  
  post '/posts/:id/like', to: 'posts#like', as: 'like_post'
  #delete '/posts/:id/unlike', to: 'posts#unlike', as: 'unlike_post'

  resources :users do
    member do
      delete :delete_post
    end
  end

  resources :comments
  post "posts/:id", to: "comments#create"
  
  get "post/:id", to: "posts#show"
  
  delete 'users/:id' => 'users#destroy', as: :destroy_user
  
  post 'user/:id/promote', to: 'users#promote_to_vip', as: :promote_to_vip_user
  post 'user/:id/demote', to: 'users#demote_from_vip', as: :demote_from_vip_user

  get 'vip', to: 'vip#index', as: 'vip'
  
  post '/user/:id/subscribe', to: 'users#subscribe', as: 'subscribe_user'
  delete '/user/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe_user'
  
  get "user/:id/edit", to: "users#edit", as: :user_edit
  patch "user/:id/edit", to: "users#update"
end
