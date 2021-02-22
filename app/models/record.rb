class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :place

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
