atom_feed do |feed|
  feed.title "Crossway Blog"
  feed.updated @articles.maximum(:updated_at)
  
  @articles.each do |article|
    feed.entry article, published: article.published_at do |entry|
      entry.title article.title
      entry.content article.content
      entry.author do |author|
        author.name article.author
      end
    end
  end
end