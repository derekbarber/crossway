class SiteController < ApplicationController
  #layout "homepage", :only => [ :home ]

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

  def resources
    @current_sermon_series = SermonSeries.where(:current_series => true).first
    @previous_sermon_series = SermonSeries.order("start_date desc").second
  end
  
  def recommended_resources
    @books = Book.all
  end

  def covenant_membership
    @sermon1 = Sermon.find_by(title: "We Are Crossway Part 1 - Introduction")
    @sermon2 = Sermon.find_by(title: "We Are Crossway Part 2 - The Benefits of Covenant Membership")
    @sermon3 = Sermon.find_by(title: "We Are Crossway Part 3 - The Responsibilities of Covenant Membership")
    @sermon4 = Sermon.find_by(title: "We Are Crossway Part 4 - The Purpose of Covenant Membership")
  end
end
