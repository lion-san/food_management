class StocksController < ApplicationController
  before_action :signed_in_user



  def index
      user = User.find( current_user.id )
      @stocks = user.stocks
  end


end
