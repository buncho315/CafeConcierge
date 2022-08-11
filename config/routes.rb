Rails.application.routes.draw do

  devise_for :end_users
  namespace :public do
    post 'end_users/index'
    get 'end_users/new'
    get 'end_users/show'
    delete 'end_users/destroy'
    resources :shops
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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
