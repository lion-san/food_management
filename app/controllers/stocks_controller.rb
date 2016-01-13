class StocksController < ApplicationController
  before_action :signed_in_user


  #=== index ===================================-

  def index
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 )
  end

  def sort_item
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 ).order("best_before_date ASC")
  end

  def sort_by_category
     @stocks = Stock.joins(:user_item)
      .where("user_items.category_id = ?", sort_params[:Category_id])
      .where( user_id: current_user.id, 
      delete_status: 0 )
  end


  #=== index ===================================-
  
  def index_all
      @stocks = Stock.where( user_id: current_user.id )
  end


  #=== edit ===================================-

  def edit_all
      store_location
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 )
  end


  def sort_edit_all
      store_location
      @stocks = Stock.where( user_id: current_user.id, 
                               delete_status: 0 ).order("best_before_date ASC")
  end

  def sort_by_category_edit_all
      store_location
      @stocks = Stock.joins(:user_item)
      .where("user_items.category_id = ?", sort_params[:Category_id])
      .where( user_id: current_user.id, 
      delete_status: 0 )
  end

  #=== update ===================================-
  def update
    if not stocks_params.nil? then

      @stocks = stocks_params.map do |id, stock_param|
        stock = Stock.find(id)
        stock.update_attributes(stock_param)
      end
    end
    #respond_with(@stocks, location: stocks_edit_all_path)
    #redirect_to stocks_edit_all_path
    redirect_back_or(stocks_edit_all_path)
  end

  #=== delete(not use) ===================================-
  def destroy
    @stock = Stock.find( params[:id] )
    @stock.delete_status = 1
    @stock.save
    #@stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_edit_all_path }
      format.json { head :no_content }
    end
  end

  private
    def stocks_params
      params.permit(stocks: [:item_status_id, :delete_status])[:stocks]
    end

    def sort_params
      params.permit(:Category_id)
    end

end
