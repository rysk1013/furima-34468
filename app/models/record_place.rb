class RecordPlace
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :record_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input Correctly'}
    validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
    validates :city
    validates :address
    validates :phone_number, length: {maximum: 11}, format: {with: /\A[0-9]\d+\z/, message: 'Input only number'}
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)

    Place.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, record_id: record.id)
  end
end