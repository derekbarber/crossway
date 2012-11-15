class SiteController < ApplicationController
  def home
    feed = Feedzirra::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")

    @entries = feed.entries.first(4)

    #p feed

    @current_sermon_series = SermonSeries.where(:current_series => true).first
    
    @posts = Post.first(4)

  end

  def visit

  end

  def god

  end

  def connect

  end

  def community_groups

  end

  def ministries

  end

  def give

  end

  def identity

  end

  def statement_of_faith

  end

end
