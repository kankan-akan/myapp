Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }
    namespace :auth do
      get 'user', to: 'users#members_only'
      # resources :guests, only: [:create]
    end
    resources :users, only: [:index, :show]

    mount_devise_token_auth_for 'AdminRange', at: 'range_auth', controllers: {
      registrations: 'v1/range_auth/registrations'
    }
    namespace :range_auth do
      get '/range', to: 'ranges#ranges_only'
      resources :ranges,  only: [:index]
    end

    resources :hello, only: [:index]

    get '/posts/my_post', to: 'posts#my_post'
    get '/posts/user_posts/:id', to: 'posts#user_posts'
    resources :posts, only: [:index, :show, :create, :destroy] do
      resources :likes, only: [:index]

    end
    get '/likes/my_like', to: 'likes#my_like'
    get '/likes/user_likes/:id', to: 'likes#user_likes'
    resource :likes, only: [:create, :destroy]

    get '/bookmarks/my_bookmark', to: 'bookmarks#my_bookmark'
    resource :bookmarks, only: [:create, :destroy]

    resources :outlines, controller: 'range_outlines', only: [:index, :show, :create, :update, :destroy]
    # get '/range_outlines/range_info', to: 'range_outlines#range_info'

    get '/lessons/reccomends', to: 'lessons#reccomend_lesson'
    get '/lessons/range_lesson', to: 'lessons#range_lesson'
    resources :lessons, only: [:index, :show, :create, :update, :destroy] do
      resources :reservations, only: [:show]
    end

    get '/reviews/my_review', to: 'reviews#my_review'
    resources :reviews, only: [:create, :update, :destroy]

    get '/reservations/my_reservation', to:'reservations#my_reservation'
    get '/reservations/search/:id', to:'reservations#search_reservation'
    resources :reservations, only: [:create, :update, :destroy]

    resource :relationships, only: [:create, :destroy]

  end
end
