class ComprarPuntosController < ApplicationController
  def update
  	@user= User.find(params[:id])
    puntos=@user.puntos_para_gauchadas
    if @user.update_attributes(params.require(:user).permit(:puntos+cantidad))
     	flash[:notice] = "Se agregaron puntos a tu cuenta"
   		redirect_to (logros_path)
    else
    	flash[:notice] = "Hubo un error, no se agregaron puntos a tu cuenta"
   		render 'edit'
    end
  end
end
