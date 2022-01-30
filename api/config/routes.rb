Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

      get 'users', to: 'users#members_only'
      get '/users/index', to: 'users#index'

      get 'posts/my_post', to: 'posts#my_post'
      resources :posts, only: [:index, :show, :create, :destroy]

      get '/reviews/my_review', to: 'reviews#my_review'
      resources :reviews, only: [:create, :update, :destroy]

    
    mount_devise_token_auth_for 'AdminRange', at: 'range_auth', controllers: {
      registrations: 'v1/range_auth/registrations'
    }
      # Define routes for AdminRange within this block.

      get '/ranges', to: 'ranges#ranges_only'
      resources :outlines, controller: 'range_outlines', only: [:index, :show, :create, :update, :destroy]

      get '/lessons/range_lesson', to: 'lessons#range_lesson'
      resources :lessons, only: [:index, :show, :create, :update, :destroy] do
        get '/reservations/range_reservation', to:'reservations#range_reservation'
        resources :reservations, only: [:show]
      end

      get '/reservations/my_reservation', to:'reservations#my_reservation'
      resources :reservations, only: [:create, :update, :destroy]

  end
end
