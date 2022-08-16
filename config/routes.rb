Rails.application.routes.draw do

  devise_for :end_users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }
  namespace :public do
    resources :end_users, only: [:show, :edit, :update]
    # get 'end_users/new'
    # get 'end_user/:id'
    # delete 'end_users/destroy'
    resources :shops do
      resources :comments, only: [:create, :index, :destroy]
    end
  end
  root to: "homes#top"
  get "/about" => 'homes#about', as: 'about'


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  namespace :admin do
    root :to =>"homes#top"
  end

  #ジャンル検索機能
  #resources :genres, only: [:show]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
