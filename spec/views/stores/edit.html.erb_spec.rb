require 'spec_helper'

describe "stores/edit" do
  before(:each) do
    @store = Factory(:store)
  end

  it "renders the edit store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stores_path(@store), :method => "post" do
      assert_select "input#store_url", :name => "store[url]"
    end
  end
end
