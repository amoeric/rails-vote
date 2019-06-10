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
            nonce = params[:payment_method_nonce]

            result = gateway.transaction.sale(
                amount: current_cart.total_price,
                payment_method_nonce: nonce,
                order_id: @order.id,
                options: {
                  submit_for_settlement:  true
                }
            )
            if result.success? 
                session[:cart9527] = nil
                redirect_to products_path, notice: '感謝你'
            else
                render 'carts/checkout'
            end
            
        else
            
            render 'carts/checkout'
        end

       
    end
    def index
        # @orders = Order.all.order(id: :desc)#把訂單照id排序
        # @orders = Order.order(id: :desc)#把訂單照id排序，all可省略不寫
        # @orders = Order.where(user: current_user) #訂單的角度
        @orders = current_user.orders #目前使用者的order,因為model那邊加入default_scope所以不用加入order排序
    end
    private
    def order_params
        params.require(:order).permit(:recipient, :phone, :address, :note)
    end
end