require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :name => "MyString",
      :image => "MyString",
      :content => "MyText",
      :type => 1
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_name", :name => "person[name]"
      assert_select "input#person_image", :name => "person[image]"
      assert_select "textarea#person_content", :name => "person[content]"
      assert_select "input#person_type", :name => "person[type]"
    end
  end
end
