require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :image => "Image",
        :book_category_id => 1,
        :url => "Url"
      ),
      stub_model(Book,
        :title => "Title",
        :subtitle => "Subtitle",
        :author => "Author",
        :image => "Image",
        :book_category_id => 1,
        :url => "Url"
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
