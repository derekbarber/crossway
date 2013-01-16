module Admin
  class HomeController < ApplicationController
    before_filter :authorize
  end
end