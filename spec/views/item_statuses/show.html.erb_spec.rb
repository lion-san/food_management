require 'spec_helper'

describe "item_statuses/show" do
  before(:each) do
    @item_status = assign(:item_status, stub_model(ItemStatus,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
