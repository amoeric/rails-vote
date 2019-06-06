require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'g order_number' do
    t = Time.local(2020,12,25,10,5,0)
    Timecop.freeze(t)
    expect(Order.ceate_order_num(2)).to eq "20201225000002"
    expect(Order.ceate_order_num(12)).to eq "20201225000012"
  end
end
