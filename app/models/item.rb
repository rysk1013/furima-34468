class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categroy, :sales_status, :shipping_fee, :prefecture, :scheduled_delivery
  belongs_to :user
  has_one_attached :image
end
