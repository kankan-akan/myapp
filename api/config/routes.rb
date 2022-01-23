Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :auth do
      get 'users', to: 'users#members_only'
      get '/users/index', to: 'users#index'

      get 'posts/my_post', to: 'posts#my_post'
      resources :posts, only: [:index, :show, :create, :destroy]
    end

    mount_devise_token_auth_for 'AdminRange', at: 'range_auth', controllers: {
      registrations: 'v1/range_auth/registrations'
    }
      # Define routes for AdminRange within this block.
    namespace :range_auth do
      get '/ranges', to: 'ranges#ranges_only'
      resources :outlines, controller: 'range_outlines', only: [:index, :show, :create, :update, :destroy]
      get '/lessons/range_lesson', to: 'lessons#range_lesson'
      resources :lessons, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
