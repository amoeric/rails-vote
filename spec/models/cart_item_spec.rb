require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart){ Cart.new }
  it "每個 Cart Item 都可以計算它自己的金額（小計）" do 
    p1 = create(:product, price: 100)#Product.create  rails_helper做得好事
    p2 = create(:product, price: 50)

    3.times{ cart.add_item(p1.id) }
    2.times{ cart.add_item(p2.id) }

    expect(cart.items.first.total_price).to eq 300 #be會連型態也一併比對，所以這裡用eq
    expect(cart.items.last.total_price).to eq 100
  end
end
