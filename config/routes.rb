Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
  }
  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords',
  }

  namespace :admin do
    resources :users, only: [:index, :show, :update]
    resources :youtubers, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :genres, except: [:index, :show, :edit]
  end

  scope module: :public do
    root to: "homes#top"
    get "/users/confirm" => "users#confirm"
    patch "/users/withdraw" => "users#withdraw"
    resources :users, only: [:index, :show, :edit, :update]
    resources :youtubers do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :genres, only: [:new, :create]
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
