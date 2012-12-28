class SiteController < ApplicationController
  def home

    @current_sermon_series = SermonSeries.where(:current_series => true).first

    @latest_sermon = Sermon.order("date desc").first

    @previous_sermon_series = SermonSeries.order("start_date desc").second

    @articles = Article.order("published_at desc").first(4)

    feed = Feedzirra::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")
    @entries = feed.entries.first(4)

  end

  def news
    news_feed = Feedzirra::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")

    @entries = news_feed.entries
  end

  def events
    event_feed = Feedzirra::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/events?format=rss")

    @entries = event_feed.entries
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

  def the_city
  end


  def resources
    @current_sermon_series = SermonSeries.where(:current_series => true).first
  end

  def give

  end


  def identity

  end

  def statement_of_faith

  end

  def staff
    @staff = People.where(:role => 1)
  end
  
  def staff_profile
    @staff_profile = People.find(params[:id])
  end

  def lay_elders
    @staff = People.where(:role => 2)
  end

end
