class AdminController < ApplicationController
  def users

    @users = User.all

  end

  def stocks

    @stocks = Stock.all

  end
end
