require 'spec_helper'

describe "sermons/show" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :title => "Title",
      :sermon_series_id => 1,
      :scripture_reference => "Scripture Reference",
      :description => "MyText",
      :speaker => "Speaker",
      :audio_file => "MyText",
      :video_embed => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/Scripture Reference/)
    rendered.should match(/MyText/)
    rendered.should match(/Speaker/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
