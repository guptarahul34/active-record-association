class AddressesController < ApplicationController
  def new
    @address = Address.new
    @address.user_id = current_user.id
  end

  def create
    @address = Address.create(address_params)
    if @address.save
       redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def address_params
      params.require(:address).permit(:address,:user_id)
    end

end
