class ChangeDefault < ActiveRecord::Migration[5.2]
  def change
    change_colum_default :orders, :state, 'pending'
  end
end
