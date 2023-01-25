Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    resources :items
    resources :request_samples
    resources :contact_supports
    end
  root to: 'admin/items#index'
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'auth#create'
      post "login", to: "auth#authenticate"
      post "profile_update", to: "auth#update"
      post "create_contact_support", to: "contact_support#create_contact_support"
      resources :items
      resources :request_samples
    end
  end
end
