class Product < ApplicationRecord
    
    #下面變數隨便自己取 :available, :expensive_product, :good_product

    acts_as_paranoid 
    #自動做default_scope { where.not(deleted_at :nil) }
    #下面搜尋就找不到刪除的那筆，其實並沒有刪除
    validates :title, presence: true
    scope :available, ->{ where(is_available: true)}  
    scope :expensive_product, -> { price_over(90) }
    scope :good_product, -> { available.expensive_product }
    scope :price_over, -> (n) { where("price >= #{n}")}


    # def self.available
    # where(is_available: true)
    # end
end
