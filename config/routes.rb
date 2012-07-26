Qianmo::Application.routes.draw do
  
  scope constraints: lambda { |r| r.env['warden'].user.nil? } do
    root :to => 'accounts#new'
    get "signup", :to => "accounts#new", :as => "signup"
    get "login", :to => "sessions#new", :as => "login"
    resources :sessions, :only => [:create]
    resources :accounts, :only => [:create]
    resource :password, :only => [:new, :create, :edit, :update]
  end
  
  resource :account, :only => [:edit, :update, :destroy]
  delete "logout", :to => 'sessions#destroy', :as => 'logout'
  
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
  end
  
  resources :articles

  resources :pages do 
    resource :billboard, :only => :update
    resource :whiteboard, :only => :update
    resources :articles
  end
  
  resources :notifications, :only => [:index]
  
  resources :users, :only => [:show, :edit, :update], :path => '' do
    resources :follows, :only => [:create, :destroy, :update, :index]
    shallow do
      resources :articles
    end
  end
  
  root :to => 'home#show'
end
