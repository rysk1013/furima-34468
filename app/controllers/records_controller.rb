class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :forbid_seller
  before_action :soldout_access_restrictions
  before_action :set_item, only: [:index, :create]

  def index
    @record_place = RecordPlace.new
  end

  def create
    @record_place = RecordPlace.new(record_place_params)
    if @record_place.valid?
      pay_item
      @record_place.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_place_params
    params.require(:record_place).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_place_params[:token],
      currency: 'jpy'
    )
  end

  def forbid_seller
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end

  def soldout_access_restrictions
    item = Item.find(params[:item_id])
    redirect_to root_path if Record.find_by(item_id: item.id).present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
