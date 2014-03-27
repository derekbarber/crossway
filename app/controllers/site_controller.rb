class SiteController < ApplicationController
  def home
    @current_sermon_series = SermonSeries.where(:current_series => true).first

    @latest_sermon = Sermon.order("date desc").first

    @previous_sermon_series = SermonSeries.order("start_date desc").second

    @articles = Article.order("published_at desc").first(4)

    feed = Feedjira::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")
    @entries = feed.entries.first(4)

  end

  def news
    news_feed = Feedjira::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/topics?format=rss")

    @entries = news_feed.entries
  end

  def events
    event_feed = Feedjira::Feed.fetch_and_parse("http://crosswaycc.onthecity.org/plaza/events?format=rss")

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

  def family_ministries

  end
  
  def outreach_inistries

  end

  def service_ministries

  end

  def creative_ministries

  end  

  def the_city
  end


  def resources
    @current_sermon_series = SermonSeries.where(:current_series => true).first

    @previous_sermon_series = SermonSeries.order("start_date desc").second
  end

  def give

  end


  def identity

  end

  def recommended_ministries

  end

  def statement_of_faith

  end

  def sitemap
  end
  
  def terms
  end
  
end
