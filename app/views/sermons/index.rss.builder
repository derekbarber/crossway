title = "Crossway Church Sermons"
author = "Crossway Church"
description = "The Crossway Church podcast features audio sermons from our weekly worship gathering. We are located on the border of Surrey and Langley in British Columbia, Canada. Our vision as a church can be summarized, 'Because of the gospel, Crossway Church exists to love Jesus, love His people and live to make Him known, all to the glory of God.'"
keywords = "Christianity, Trinity, God, Jesus, Holy Spirit,Crossway Church, sermons, teaching, theology, surrey, langley"
image = "https://www.crossway.ca/img/cc_podcast.jpg"
ext = 'mp3'

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://crossway.ca'
    xml.description description
    xml.language 'en'
    xml.pubDate @sermons.first.date.to_s(:rfc822)
    xml.lastBuildDate @sermons.first.date.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'info@crossway.ca'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Religion & Spirituality' do
      xml.itunes :category, :text => 'Christianity'
    end

    @sermons.each do  |sermon|
      xml.item do
        xml.title sermon.title
        xml.description "#{sermon.title}: #{sermon.scripture_reference}"
        xml.pubDate sermon.date.to_s(:rfc822)
        xml.enclosure :url => "http://www.crossway.ca#{sermon.audio_file_url}", rel:"enclosure", :type => 'audio/mpeg'
        xml.link sermon_url(sermon)
        xml.guid({:isPermaLink => "false"}, sermon_url(sermon))
        xml.itunes :author, sermon.speaker
        xml.itunes :subtitle, sermon.scripture_reference
        xml.itunes :summary, "#{sermon.title}: #{sermon.scripture_reference}"
        xml.itunes :explicit, 'no'
        if sermon.audio_file_duration? && (sermon.audio_file_duration.to_i > 0)
          xml.itunes :duration, sermon.audio_file_duration
        end
      end
    end
  end
end