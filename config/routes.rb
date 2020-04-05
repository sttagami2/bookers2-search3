Rails.application.routes.draw do
  devise_for :users
  
  resources :relationships, only: [:create, :destroy]
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers, :follow, :follower
    end
  end
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    # ↑resourceが複数形になっていてidを上手く渡せないroute matchエラーが起きていた
  end
  
  root 'home#top'
  get 'home/about', to: 'home#about'
  get 'users/:id/following', to: 'users#following'
  get 'users/:id/followers', to: 'users#followers'
  get '/search' => 'search#search'
  post '/books/:book_id/favorites' => "favorites#create"
  delete '/books/:book_id/favorites' => "favorites#destroy"
end