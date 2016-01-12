module UserItemsHelper
  def get_purchase_date
    return session[:purchase_date]
  end

  def set_purchase_date(date)
    session[:purchase_date] = date
  end
end
