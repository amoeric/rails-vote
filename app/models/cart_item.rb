class CartItem
    attr_reader :product_id
    attr_accessor :quantity
    def initialize(product_id, quantity = 1) #數量至少一個,且彈性
        @product_id = product_id
        @quantity = quantity
    end

    def increment(n = 1)
        @quantity = quantity + n
    end

    def product
        Product.find_by(id: product_id)
    end

    def total_price
        
        product.price * quantity
    end
end