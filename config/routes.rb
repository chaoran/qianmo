Qianmo::Application.routes.draw do
  match "douban/:category/search" => 'douban#search', :as => :douban_search
  match "douban/:category/get/:id" => 'douban#get', :as => :douban_get

  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    root :to => 'accounts#new'
    get "signup", :to => "accounts#new", :as => "signup"
    get "login", :to => "sessions#new", :as => "login"
    resources :sessions, :only => [:create]
    resources :accounts, :only => [:create]
    resource :password, :only => [:new, :create, :edit, :update]
  end
  
  resource :account, :only => [:edit, :update, :destroy]
  get "logout", :to => 'sessions#destroy', :as => 'logout'
  
  # belongs to user
  resource :avatar, :only => [:new, :create, :edit, :update]
  
  # User should be signed in to request confirmation
  resource :confirmation, :only => [:new, :create, :show] # show is used for confirmation
  # User need to fill in his email to reset password
  resources :passwords, :only => [:new, :create, :edit, :update]

  resources :posts do
    shallow do
      resources :comments, :only => [:new, :create, :destroy]
    end
    member do
      get 'repost' => 'posts#edit'
      post 'like' => 'likes#create'
      delete 'like' => 'likes#destroy'
    end
    resources :likes, :only => [:index]
  end
      
  resources :pages do 
    resource :page_follows, :path => 'follow', :as => :follow,
              :only => [:create, :destroy] 
  end
  resources :articles
  resources :pictures
  resources :galleries, :only => [:new, :create]
  
  resources :notifications, :only => [:index] do
    put 'update', :on => :collection
  end
  
  resources :users, :only => [:show, :edit, :update], :path => '' do
    resources :posts, :only => [:index]
    resources :follows, :only => [:create, :destroy, :update, :index] do 
      put "update_all", :on => :collection
    end
    resources :articles, :only => [:index]
  end
  
  root :to => 'posts#index'
end
