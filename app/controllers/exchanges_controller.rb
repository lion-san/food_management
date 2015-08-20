class ExchangesController < ApplicationController
  def new
     @item = Item.find(params[:id])
  end
end
