class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :price 
  end
  
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price, format: {with: /\A[0-9]+\z/}
  
  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee, :prefecture, :scheduled_delivery
end
