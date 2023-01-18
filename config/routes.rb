Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    resources :items
    resources :request_samples
    end
  root to: 'admin/items#index'
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'auth#create'
      post "login", to: "auth#authenticate"
      resources :items do
        resources :request_samples
      end
    end
  end
end
