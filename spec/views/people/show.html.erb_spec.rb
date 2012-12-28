require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :image => "Image",
      :content => "MyText",
      :type => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Image/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
