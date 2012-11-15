require 'spec_helper'

describe "sermons/edit" do
  before(:each) do
    @sermon = assign(:sermon, stub_model(Sermon,
      :title => "MyString",
      :sermon_series_id => 1,
      :scripture_reference => "MyString",
      :description => "MyText",
      :speaker => "MyString",
      :audio_file => "MyText",
      :video_embed => "MyText"
    ))
  end

  it "renders the edit sermon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sermons_path(@sermon), :method => "post" do
      assert_select "input#sermon_title", :name => "sermon[title]"
      assert_select "input#sermon_sermon_series_id", :name => "sermon[sermon_series_id]"
      assert_select "input#sermon_scripture_reference", :name => "sermon[scripture_reference]"
      assert_select "textarea#sermon_description", :name => "sermon[description]"
      assert_select "input#sermon_speaker", :name => "sermon[speaker]"
      assert_select "textarea#sermon_audio_file", :name => "sermon[audio_file]"
      assert_select "textarea#sermon_video_embed", :name => "sermon[video_embed]"
    end
  end
end
