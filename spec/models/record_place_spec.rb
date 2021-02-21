require 'rails_helper'

RSpec.describe RecordPlace, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @buyer = FactoryBot.build(:record_place)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'price,token,postal_code,prefecture_id,city,adress,phone_numberが存在すれば購入できる' do
        expect(@buyer).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空では購入できない' do
        @buyer.token = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @buyer.postal_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'posta_codeがハイフンが無いと購入できない' do
        @buyer.postal_code = '1111111'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Postal code Input Correctly')
      end

      it 'prefecture_idが空では購入できない' do
        @buyer.prefecture_id = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では購入できない' do
        @buyer.prefecture_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空では購入できない' do
        @buyer.city = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @buyer.address = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @buyer.phone_number = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと購入できない' do
        @buyer.phone_number = '090123456789'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberが数字以外だと購入できない' do
        @buyer.phone_number = 'aaabbbbcccc'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
