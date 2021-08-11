Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords'
  }
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }

  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :youtubers, only: [:index, :show, :destroy]
    resources :genres, except: [:index, :show, :edit]
    resources :comments, only: [:destroy]
  end

  scope module: :public do
    root to: "homes#top"
    get "/users/confirm" => "users#confirm"
    patch "/users/withdraw" => "users#withdraw"
    resources :users, only: [:index, :show, :edit, :update]
    resources :youtubers
    resources :genres, only: [:new, :create]
    resource :follows, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
