Crossway::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :books, :only => [:index, :show]
  resources :articles, :only => [:index, :show]
  resources :posts, :only => [:index, :show]
  resources :sermons, :only => [:index, :show]
  resources :sermon_series, :only => [:index, :show]
  resources :charges
  resources :people, :only => [:index, :show]

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  resources :contact, :only => [:new, :create]

  get '/home',   to: 'site#home'
  get '/news',   to: 'site#news', as: 'news'
  get '/events',   to: 'site#events'
  get '/visit',   to: 'site#visit'
  get '/god',   to: 'site#god', as: 'god'
  get '/connect',   to: 'site#connect', as: 'connect'
  get '/connect/sunday-gatherings', to: 'site#sunday_gatherings'
  get '/connect/community-groups', to: 'site#community_groups'
  get '/connect/discipleship-groups', to: 'site#discipleship_groups'
  get '/connect/ministries',   to: 'site#ministries'
  get '/connect/family-ministries',   to: 'site#family_ministries'
  get '/connect/outreach-ministries',   to: 'site#outreach_ministries'
  get '/connect/service-ministries',   to: 'site#service_ministries'
  get '/connect/creative-ministries',   to: 'site#creative_ministries'
  get '/connect/the-city',   to: 'site#the_city'
  get '/give',   to: 'site#give'
  get '/resources',   to: 'site#resources'
  get '/about',   to: 'site#about'
  get '/covenant-membership',   to: 'site#covenant_membership'
  get '/we-are-crossway',   to: 'site#covenant_membership'
  get '/identity/statement-of-faith',   to: 'site#statement_of_faith'
  get '/identity/recommended-ministries',   to: 'site#recommended_ministries'
  get '/identity/affiliations',   to: 'site#affiliations'

  get '/terms', to: 'site#terms'
  get '/sitemap', to: 'site#sitemap'

  namespace :manage do
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
