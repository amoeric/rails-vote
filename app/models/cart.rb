class Cart
    attr_reader :items
    def initialize(items = [])
        @items = items
    end
    #items會去找reader的items方法
    def add_item(product_id)
        found_item = items.find {|item| item.product_id == product_id}
        if found_item
            found_item.increment
        else
            items << CartItem.new(product_id)
        end
    end

    def empty?
        items.empty?
    end

    def total_price
        total = items.reduce(0){ |sum, item| sum + item.total_price}

        if xmas?
            total *= 0.9
        else
            total
        end
    end

    def serialize
        # result = [
        #     { product_id: 1, quantity: 3},
        #     { product_id: 2, quantity: 5}
        # ] 
        result = items.map { |item| 
            { product_id: item.product_id, quantity: item.quantity } 
        }
        return { items: result}
    end
    def self.from_hash(hash = nil)
        if hash && hash[:items] 
            #重組
            #組出充滿 CartItem 的陣列
            new hash[:items].map { |item| CartItem.new(item[:product_id], item[:quantity]) }
        else
            #新車
            new
        end
    end

    private 
    def xmas?
        Time.now.month == 12 && Time.now.day == 25
    end
end