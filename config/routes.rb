Rails.application.routes.draw do
  resources :users, only: [:index, :create] do
    collection do
      get :get_posts_top
      get :get_ip
    end
    resources :posts, controller: 'users/posts', only: [:show, :new, :create, :index] do
      resources :evaluations, controller: 'users/posts/evaluations', only: :create
    end
  end
end
