class OrdersController < ApplicationController
    before_action :authenticate_user!
    include CartHelper
    include Payable

    def create
        #建立訂單
        
        # @order = Order.new(order_params)
        # @order.user = current_user#訂單要有user

        @order = current_user.orders.build(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(product: item.product, 
                                    quantity: item.quantity,
                                    strike_price: item.product.price)
        end

        if @order.save
            redirect_to products_path, notice: '感謝你'
        else
            render 'carts/checkout'
        end

       
    end

    private
    def order_params
        params.require(:order).permit(:recipient, :phone, :address, :note)
    end
end