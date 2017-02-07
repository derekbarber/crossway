Crossway::Application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :articles, :only => [:index, :show]
  resources :sermons, :only => [:index, :show]
  resources :sermon_series, :only => [:index, :show]
  resources :charges
  resources :people, :only => [:index, :show]

  get '/podcast', to: 'sermons#index', :defaults => { :format => 'rss' }

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  resources :contact, :only => [:new, :create]

  get '/home',   to: 'site#home'
  get '/news',   to: 'site#news', as: 'news'
  get '/events',   to: 'site#events'
  get '/visit',   to: 'site#visit'
  get '/god',   to: 'site#god', as: 'god'
  get '/connect',   to: 'site#sunday_gatherings', as: 'connect'
  get '/connect/sunday-gatherings', to: 'site#sunday_gatherings'
  get '/connect/community-groups', to: 'site#community_groups'
  get '/connect/discipleship-groups', to: 'site#discipleship_groups'
  get '/connect/ministries',   to: 'site#ministries', as: "ministries"
  get '/connect/crosswaykids',   to: 'site#crosswaykids'
  get '/connect/ministries/missions',   to: 'site#missions', as: "missions"
  get '/connect/service-ministries',   to: 'site#service_ministries'
  get '/connect/creative-ministries',   to: 'site#creative_ministries'
  get '/connect/the-city',   to: 'site#the_city'
  get '/give',   to: 'site#give'
  get '/resources',   to: 'site#resources'
  get '/about',   to: 'site#covenant_membership'
  get '/covenant-membership',   to: 'site#covenant_membership'
  get '/identity/statement-of-faith',   to: 'site#statement_of_faith'
  get '/identity/recommended-resources',   to: 'site#recommended_resources', as: "recommended_resources"
  get '/identity/affiliations',   to: redirect(path: '/identity/recommended-resources')

  get '/terms', to: 'site#terms'
  get '/sitemap', to: 'site#sitemap'

  get '/missions',   to: redirect(path: '/connect/ministries/missions')
  get '/we-are-crossway',   to: redirect(path: 'covenant-membership')

  root :to => 'site#home'
end
