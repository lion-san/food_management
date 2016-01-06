require 'spec_helper'

describe StocksController do

  describe "GET 'index_all'" do
    it "returns http success" do
      get 'index_all'
      response.should be_success
    end
  end

end
