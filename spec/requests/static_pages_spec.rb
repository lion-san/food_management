require 'spec_helper'

describe "StaticPages" do

  it "should have the title 'Home'" do
    visit '/static_pages/home'
    expect(page).to have_title("No Foodloss | Home")
  end

  describe "Home page" do
    it "should have the content 'No Foodloss'" do
      visit '/static_pages/home'
      expect(page).to have_content('No Foodloss')
    end
  end

  it "should have the title 'Help'" do
    visit '/static_pages/help'
    expect(page).to have_title("No Foodloss | Help")
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

end
