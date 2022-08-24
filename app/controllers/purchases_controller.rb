class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_shipping_address = PurchaseShippingAddress.new
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:zip_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
