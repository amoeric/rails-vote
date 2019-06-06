class CartsController < ApplicationController
    include CartHelper
    before_action :authenticate_user!

    def add
        current_cart.add_item(params[:id])
        session[:cart9527] = current_cart.serialize
        
        redirect_to products_path, notice: '已加入購物車'
    end
    
    def show
    end

    def destroy
        session[:cart9527] = nil
        redirect_to products_path, notice: '購物車已清空'
    end
end
