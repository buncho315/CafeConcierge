Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => 'homes#about', as: 'about'

  devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "end_users/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #resources :end_users ,only: [:new, :create, :index, :show, :destroy]
  #resources :admins, only: [:show, :edit, :update]

  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  namespace :admin do
    root :to =>"homes#top"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
