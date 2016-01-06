require 'spec_helper'

describe "item_statuses/edit" do
  before(:each) do
    @item_status = assign(:item_status, stub_model(ItemStatus,
      :name => "MyString"
    ))
  end

  it "renders the edit item_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_status_path(@item_status), "post" do
      assert_select "input#item_status_name[name=?]", "item_status[name]"
    end
  end
end
