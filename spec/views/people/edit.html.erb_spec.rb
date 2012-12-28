require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "MyString",
      :image => "MyString",
      :content => "MyText",
      :type => 1
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_image", :name => "person[image]"
      assert_select "textarea#person_content", :name => "person[content]"
      assert_select "input#person_type", :name => "person[type]"
    end
  end
end
