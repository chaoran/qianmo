Qianmo::Application.routes.draw do

  
  resources :posts, :except => [:new] do
    member do
      get :new
    end
  end
    
  resources :comments do 
  end

  resources :pages do 
    resource :billboard, :only => :update
    resource :whiteboard, :only => :update
  end
  
  devise_for :users, :path => '',
             :path_names => { :sign_in => "login", 
                              :sign_up => "register",
                              :sign_out => "logout",
                            },
             :controllers => { :registrations => "accounts",
                               :passwords => "passwords", 
                               :confirmations => "confirmations",
                               :sessions => "sessions" }
  
  as :user do
    root :to => 'homes#show'
  end
    
  resources :users, :path => '', :only => '' do
    resource :avatar, :only => [:new, :create, :edit, :update]
    resource :profile, :except => :destroy
    resource :friendship, :only => [:create, :destroy]
    resource :follow, :only => [:create, :destroy]
  end  
  
  resources :friend_events, :only => [:create, :destroy, :update]
  resources :mention_events, :only => [:create, :destroy, :update]
  
  match 'like/:type/:id' => 'likes#create', :via => :post, :as => :like
  match 'like/:type/:id' => 'likes#destroy', :via => :delete, :as => :unlike
  #root :to => 'accounts#new'
  
  #resources :accounts do
  #  resource :profile, :except => :destroy 
  #end
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
