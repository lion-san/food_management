require 'spec_helper'

describe "item_statuses/index" do
  before(:each) do
    assign(:item_statuses, [
      stub_model(ItemStatus,
        :name => "Name"
      ),
      stub_model(ItemStatus,
        :name => "Name"
      )
    ])
  end

  it "renders a list of item_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
