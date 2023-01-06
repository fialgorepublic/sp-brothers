Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    resources :items
    end
  root to: 'admin/items#index'
end
