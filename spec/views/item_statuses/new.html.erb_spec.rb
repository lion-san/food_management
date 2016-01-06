require 'spec_helper'

describe "item_statuses/new" do
  before(:each) do
    assign(:item_status, stub_model(ItemStatus,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new item_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_statuses_path, "post" do
      assert_select "input#item_status_name[name=?]", "item_status[name]"
    end
  end
end
