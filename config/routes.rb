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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
