class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :forbid_seller

  def index
    @item = Item.find(params[:item_id])
    @record_place = RecordPlace.new
  end

  def create
    @record_place = RecordPlace.new(record_place_params)
    if @record_place.valid?
      pay_item
      @record_place.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def record_place_params
    params.require(:record_place).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def forbid_seller
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_c6f8134dafef0d98affedeca"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: record_place_params[:token],
      currency: 'jpy'
    )
  end
end
