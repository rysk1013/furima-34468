class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categroy_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id
  belongs_to :user
  has_one_attached :image
end
