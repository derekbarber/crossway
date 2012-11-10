class SiteController < ApplicationController
  def home
    feed = Feedzirra::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")
    
    @entries = feed.entries
    
    p feed
  end

end
