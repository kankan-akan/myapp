Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }
    namespace :auth do
      get 'users', to: 'users#members_only'
      resources :users, only: [:index, :show]
    end

    mount_devise_token_auth_for 'AdminRange', at: 'range_auth', controllers: {
      registrations: 'v1/range_auth/registrations'
    }
    namespace :range_auth do 
      get '/ranges', to: 'ranges#ranges_only'
    end

      get 'posts/my_post', to: 'posts#my_post'
      resources :posts, only: [:index, :show, :create, :destroy] do
        get 'likes/like_users', to: 'likes#like_users'
      end
      resource :likes, only: [:create, :destroy]

      resources :outlines, controller: 'range_outlines', only: [:index, :show, :create, :update, :destroy]

      get '/lessons/range_lesson', to: 'lessons#range_lesson'
      resources :lessons, only: [:index, :show, :create, :update, :destroy] do
        resources :reservations, only: [:show]
      end

      get '/reviews/my_review', to: 'reviews#my_review'
      resources :reviews, only: [:create, :update, :destroy]

      get '/reservations/my_reservation', to:'reservations#my_reservation'
      resources :reservations, only: [:create, :update, :destroy]

      resources :relationships, only: [:create, :destroy]

  end
end
