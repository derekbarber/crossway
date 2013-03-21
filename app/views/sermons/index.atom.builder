atom_feed({'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd', 'version' => '2.0', 'xmlns:atom' => "http://www.w3.org/2005/Atom"}) do |feed|
  feed.title "Crossway Church Podcast"
  #feed.updated @sermons.first.updated_at.strftime("%d-%m-%Y %H:%M:%S %Z")
  feed.link "", href:"http://www.crossway.ca"
  feed.link "", ref:"self", href:"http://www.crossway.ca/sermons.atom"
  feed.description "The Crossway Church podcast features sermons from our weekly worship gathering. We are located on the border of Surrey and Langley in British Columbia, Canada. Our vision as a church can be summarized, 'Because of the gospel, Crossway Church exists to love Jesus, love His people and live to make Him known, all to the glory of God.'"
  feed.copyright "Copyright 2013 Crossway Church"
  feed.author do |author|
    author.name "Crossway Church"
  end

  feed.tag!('itunes:subtitle', "Sermons from Crossway Church")
  feed.tag!('itunes:author', "Crossway Church")
  feed.tag!('media:copyright', "Copyright 2013 Crossway Church")
  feed.tag!('itunes:summary', "The Crossway Church podcast features sermons from our weekly worship gathering. We are located on the border of Surrey and Langley in British Columbia, Canada. Our vision as a church can be summarized, 'Because of the gospel, Crossway Church exists to love Jesus, love His people and live to make Him known, all to the glory of God.'")
  feed.tag!('itunes:keywords', "Trinity,God,Jesus,Holy,Spirit,Crossway,Church,Sermons,Teaching,Theology,Surrey,Langley")

  feed.tag!('itunes:owner') do |owner|
    owner.tag!('itunes:name', "Crossway Church")
    owner.tag!('itunes:email', "info@crossway.ca")
  end
  feed.tag!('itunes:image', href:"http://www.crossway.ca/img/cc_podcast.jpg")
  feed.tag!('itunes:category', text:"Religion & Spirituality") do |category|
    category.tag!('itunes:category', text:"Christianity")
  end
  feed.tag!('itunes:new-feed-url', "http://www.crossway.ca/sermons.atom")
  feed.tag!('itunes:explicit', "No")

  @sermons.each do |sermon|
    feed.tag!('item') do |entry|
      entry.id sermon_url(sermon)
      entry.title sermon.title
      entry.sumary "#{sermon.title}: #{sermon.scripture_reference}"
      entry.tag!("itunes:author", sermon.speaker)
      entry.tag!("itunes:subtitle", sermon.scripture_reference)
      entry.tag!("itunes:summary", "#{sermon.title}: #{sermon.scripture_reference}")
      entry.link "", href:"http://www.crossway.ca#{sermon.audio_file_url}", rel:"enclosure", type:"audio/mpeg"
      #entry.guid "http://www.crossway.ca#{sermon.audio_file_url}"
      entry.updated sermon.date.strftime("%-d/%-m/%Y %H:%M:%S %Z")
      entry.enclosure "", url:"http://www.crossway.ca#{sermon.audio_file_url}", rel:"enclosure", type:"audio/mpeg" 
    end
  end
end
