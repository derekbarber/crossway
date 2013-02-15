# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.crossway.ca"
SitemapGenerator::Sitemap.sitemaps_host = ENV['SITEMAP_HOST']
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  add '/contact'
  add '/news', :changefreq => 'weekly'
  add '/events', :changefreq => 'weekly'
  add '/visit', :changefreq => 'weekly'
  add '/god', :changefreq => 'weekly'
  add '/connect', :changefreq => 'weekly'
  add '/connect/community-groups', :changefreq => 'weekly'
  add '/connect/ministries', :changefreq => 'weekly'
  add '/connect/the-city', :changefreq => 'weekly'
  add '/give', :changefreq => 'weekly'
  add '/resources', :changefreq => 'weekly'
  add '/identity', :changefreq => 'weekly'
  add '/identity/statement-of-faith', :changefreq => 'weekly'
  add '/identity/recommended-ministries', :changefreq => 'weekly'
  add '/identity/partnerships', :changefreq => 'weekly'
  add '/identity/staff', :changefreq => 'weekly'
  add '/identity/lay-elders', :changefreq => 'weekly'

  Article.find_each do |article|
    add article_path(article), lastmod: article.updated_at
  end
end

SitemapGenerator::Sitemap.ping_search_engines

#SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
#end
