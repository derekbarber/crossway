require 'spec_helper'

describe "sermons/index" do
  before(:each) do
    assign(:sermons, [
      stub_model(Sermon,
        :title => "Title",
        :sermon_series_id => 1,
        :scripture_reference => "Scripture Reference",
        :description => "MyText",
        :speaker => "Speaker",
        :audio_file => "MyText",
        :video_embed => "MyText"
      ),
      stub_model(Sermon,
        :title => "Title",
        :sermon_series_id => 1,
        :scripture_reference => "Scripture Reference",
        :description => "MyText",
        :speaker => "Speaker",
        :audio_file => "MyText",
        :video_embed => "MyText"
      )
    ])
  end

  it "renders a list of sermons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Scripture Reference".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Speaker".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
