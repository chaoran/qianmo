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
    get :repost, :on => :member
  end
    
  resources :comments do 
  end

  resources :pages do 
    resource :billboard, :only => :update
    resource :whiteboard, :only => :update
    resources :articles
  end
  
  match 'like/:type/:id' => 'likes#create', :via => :post, :as => :like
  match 'like/:type/:id' => 'likes#destroy', :via => :delete, :as => :unlike
  
  resources :users, :only => [:show, :edit, :update], :path => '' do
    
    resources :follows, :only => [:create, :destroy, :update, :index]
    
    shallow do
      resources :articles
      resources :notifications, :only => [:create, :destroy, :update, :index]
    end
  end
  
  root :to => 'home#show'
end
