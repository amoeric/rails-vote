module CartHelper
  def current_cart
    @ccaskj1929cc ||= Cart.from_hash(session[:cart9527])
  end

end