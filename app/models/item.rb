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
    validates :price, format: { with: /\A[0-9]\d+\z/, message: 'Half-width number' }
  end

  validates :name, length: { maximum: 40 }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is Out of settign range' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
