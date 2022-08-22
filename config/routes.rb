Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  namespace :public do
    get '/search' => 'searches#search'
    resources :end_users, only: [:show, :edit, :update]
    resources :shops do
      resources :comments, only: [:create, :index, :destroy]
      resource :favorites, only: [:create, :destroy]
      #いいね機能
    end
  end
  get 'public/end_user/:id/unsubscribe' => 'public/end_users#unsubscribe', as: 'unsubscribe'
        # 論理削除用のルーティング
      patch '/public/end_user/:id/withdrawal' => 'public/end_users#withdrawal', as: 'withdrawal'

  root to: "homes#top"
  get "/about" => 'homes#about', as: 'about'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  #ゲストユーザーが削除機能を使用できないようにする
  # devise_for :end_users, controllers: {
  #   registrations: 'end_users/registrations'
  # }

  namespace :admin do
    root :to =>"homes#top"
    resources :shops, only: [:index, :show, :edit, :update, :destroy]
    resources :end_users, only: [:index, :show, :edit, :update, :destroy]
    #ジャンル検索機能
    resources :genres, only: [:create, :index, :edit, :update]
  end

  get 'admin/end_user/:id/unsubscribe' => 'admin/end_users#unsubscribe', as: 'admin/unsubscribe'
        # 論理削除用のルーティング
      patch '/admin/end_user/:id/withdrawal' => 'admin/end_users#withdrawal', as: 'admin/withdrawal'

  #ジャンル検索機能
  #resources :genres, only: [:create, :index, :update, :edit]


end
