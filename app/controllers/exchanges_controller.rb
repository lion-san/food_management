class ExchangesController < ApplicationController
  before_action :signed_in_user, only: [:create]
  def new
    @exchange = Exchange.new
    @item = Item.find(params[:id])
  end

  def create

    @exchange = Exchange.new
    @exchange.item_id = params[:id]
    @exchange.buyer_id = @current_user.id

    @exchange.status = 1 #売約済み 
    @exchange.appraisal = 0
    @exchange.comment = ""

    if @exchange.save
      redirect_to exchanges_next_path
    else
      render 'new'
    end
  end


  def next
  end


  private

    def exchange_params
      params.require(:exchange).permit(:item_id, :buyer_id)
    end


end
