Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
    resources :items
    resources :request_samples do
      get :samples, on: :member
    end
    resources :contact_supports
    resources :users
  end
  get 'privacy_policy', to: 'home#privacy_policy'
  root to: 'admin/items#index'
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'auth#create'
      post 'logout', to: 'auth#logout'
      post "login", to: "auth#authenticate"
      post "profile_update", to: "auth#update"
      post "create_contact_support", to: "contact_support#create_contact_support"
      resources :items
      resources :videos
      resources :request_samples do
        post :add_to_cart, on: :collection
      end
    end
  end
end
