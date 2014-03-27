module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    end
  end

  def navbar_list_item(text, path, opts={})
    return if opts[:hide]
    cls = request.fullpath == path ? 'active' : ''
    content_tag :li, :class => cls do
      link_to text.html_safe, path, opts
    end
  end

  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
   end

   def twitter_button(url, text)
     url = root_url.chomp('/') + url

     twitter_options = { 
       :class => "twitter-share-button", 
       'data-url' => url,
       'data-counturl' => url,
       'data-text' => "#{text} via @crosswayca",
       'data-count' => 'horizontal',
       'lang' => I18n.locale
     }

     link_to "Tweet", "https://twitter.com/share", twitter_options
   end

   def facebook_button(url)
     if ['production', 'staging'].include?(Rails.env)
       url = root_url.chomp('/') + url
     else
       url = "http://desiringgod.herokuapp.com" + url
     end
    
     facebook_options = { 
       :class => "fb-like", 
       'data-href' => url,
       'data-send' => "false",
       'data-layout' => "button_count",
       'data-width' => '120',
       'data-show-faces' => "false"
     }

     content_tag :div, '', facebook_options
   end

   def twitter_feed
     twitter_client = Twitter::Client.new(
       :consumer_key => TWITTER_CONSUMER_KEY,
       :consumer_secret => TWITTER_CONSUMER_SECRET,
       :oauth_token => TWITTER_ACCESS_TOKEN,
       :oauth_token_secret => TWITTER_ACCESS_TOKEN_SECRET
     )

     twitter_client.user_timeline("desiringgod", :count => 1) + twitter_client.user_timeline("johnpiper", :count => 1)
   end
end
