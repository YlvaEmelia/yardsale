Rails.application.routes.draw do
  resources :posts
  root 'posts#index'
  
  #resources :tags
  get '/tags/:tag', to: 'posts#index', as: :tag
  
  namespace :admin do
    root to: "admin#index"
    resources :posts do
      collection { post :import }
    end
  end

  
end
