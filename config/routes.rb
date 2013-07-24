Crossway::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :articles, :only => [:index, :show]
  resources :posts
  resources :sermons, :only => [:index, :show]
  resources :sermon_series, :only => [:index, :show]
  resources :charges

  #resources :pages, except: :show
  #get ':id', to: 'pages#show', as: :page
  #put ':id', to: 'pages#update', as: :page
  #delete ':id', to: 'pages#destroy', as: :page
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  resources :contact
  #match 'contact' => 'contact#create', :as => 'contact', :via => :post

  get '/home',   to: 'site#home'
  get '/news',   to: 'site#news'
  get '/events',   to: 'site#events'
  get '/visit',   to: 'site#visit'
  get '/god',   to: 'site#god'
  get '/connect',   to: 'site#connect'
  get '/connect/community-groups', to: 'site#community_groups'
  get '/connect/ministries',   to: 'site#ministries'
  get '/connect/family-ministries',   to: 'site#family_ministries'
  get '/connect/outreach-ministries',   to: 'site#outreach_ministries'
  get '/connect/service-ministries',   to: 'site#service_ministries'
  get '/connect/creative-ministries',   to: 'site#creative_ministries'
  get '/connect/the-city',   to: 'site#the_city'
  get '/give',   to: 'site#give'
  get '/resources',   to: 'site#resources'
  get '/identity',   to: 'site#identity'
  get '/identity/statement-of-faith',   to: 'site#statement_of_faith'
  get '/identity/recommended-ministries',   to: 'site#recommended_ministries'
  get '/identity/partnerships',   to: 'site#partnerships'
  get '/identity/staff',   to: 'site#staff'
  get '/identity/lay-elders',   to: 'site#lay_elders'
  
  get '/terms', to: 'site#terms'
  get '/sitemap', to: 'site#sitemap'

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
