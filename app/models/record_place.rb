class RecordPlace
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :record_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1, message: 'Select'}
    validates :city
    validates :address
    validates :phone_number
    validates :record_id
    validates :user_id
    validates :item_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: params[:id])

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, phone_number: phone_number, record_id: record.id)
  end
end