class PagoController < ApplicationController
  def new
  end
  def create
    @pago =Pago.new(params.require(:pago).permit(:monto, :user_id))
    @user =current_user
    @pago.user_id = @user.id
    end

  end
end
