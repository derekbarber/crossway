atom_feed do |feed|
  feed.title "Crossway Church Podcast"
  feed.link "http://www.crossway.ca"
  feed.copyright "Copyright 2013 Crossway Church"
  feed.image do |image|
    image.url "http://www.crossway.ca/images/cc_podcast.jpg"
    image.title "Crossway Church Podcast"
    image.link "http://www.crossway.ca"
  end
  feed.updated @sermons.first.updated_at

  feed.tag!('itunes:subtitle', "Surrey, BC")
  feed.tag!('itunes:author', "Crossway Church")
  feed.tag!('itunes:summary', "This is the Crossway Church podcasts feed which is updated weekly with the latest sermons")
  feed.description "This is the Crossway Church podcasts feed which is updated weekly with the latest sermons"
  
  feed.tag!('itunes:image', "http://www.crossway.ca/images/cc_podcast.jpg")
  feed.tag!('itunes:explicit', "No")

  @sermons.each do |sermon|
    feed.entry sermon, published: sermon.date do |entry|
      entry.title sermon.title
      entry.subtitle sermon.scripture_reference
      entry.author do |author|
        author.name sermon.speaker
      end
      feed.enclosure do |enclosure|
          enclosure.url sermon.audio_file_url, rel:"enclosure", type:"image/mpeg" 
      end
    end
  end
end
