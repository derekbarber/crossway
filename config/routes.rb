Crossway::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :articles, :only => [:index, :show]
  resources :posts
  resources :sermons, :only => [:index, :show]
  resources :sermon_series, :only => [:index, :show]

  #resources :pages, except: :show
  #get ':id', to: 'pages#show', as: :page
  #put ':id', to: 'pages#update', as: :page
  #delete ':id', to: 'pages#destroy', as: :page
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  match '/home',   to: 'site#home'
  match '/news',   to: 'site#news'
  match '/events',   to: 'site#events'
  match '/visit',   to: 'site#visit'
  match '/god',   to: 'site#god'
  match '/connect',   to: 'site#connect'
  match '/connect/community-groups', to: 'site#community_groups'
  match '/connect/ministries',   to: 'site#ministries'
  match '/connect/the-city',   to: 'site#the_city'
  match '/give',   to: 'site#give'
  match '/resources',   to: 'site#resources'
  match '/identity',   to: 'site#identity'
  match '/identity/statement-of-faith',   to: 'site#statement_of_faith'
  match '/identity/partnerships',   to: 'site#partnerships'
  match '/identity/staff',   to: 'site#staff'
  match '/identity/lay-elders',   to: 'site#lay_elders'
  
  match '/terms', to: 'site#terms'
  match '/sitemap', to: 'site#sitemap'

  namespace :admin do
    root to: "home#index"
    resources :users
    resources :people
    resources :sessions, :only => [:create]
    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    resources :articles
    resources :sermons
    resources :sermon_series
  end

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
  root :to => 'site#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
