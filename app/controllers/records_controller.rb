class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @record_place = RecordPlace.new
  end

  def create
    @record_place = RecordPlace.new(record_place_params)
    if @record_place.valid?
      @record_place.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def record_place_params
    params.require(:record_place).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
