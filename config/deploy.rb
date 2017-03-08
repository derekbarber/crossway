require "bundler/capistrano"
require "capistrano-rbenv"
require 'capistrano/ext/multistage'
set :rbenv_ruby, "2.3.1"
set :stages, %w(production staging)
set :default_stage, "staging"
set :application, "crossway"
set :user, "deployer"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:derekbarber/#{application}.git"
