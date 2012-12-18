atom_feed do |feed|
  feed.title "Superhero Articles"
  feed.updated @posts.maximum(:updated_at)
  
  @posts.each do |post|
    feed.entry article, published: post.published_at do |entry|
      entry.title post.name
      entry.content article.content
      entry.author do |author|
        author.name article.author
      end
    end
  end
end