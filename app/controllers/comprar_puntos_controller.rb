class ComprarPuntosController < ApplicationController
  def actualizar
    @user = current_user
    puntos=@user.puntos_para_gauchadas+(params[:cantidad].to_i)
    if params[:tarjeta].length == 16 && params[:codigo].length== 3
      @user.puntos_para_gauchadas=puntos
      if @user.save
     	  flash[:notice] = "Se agregaron puntos a tu cuenta"
   		  redirect_to (gauchadas_path)
      else
    	  flash[:notice] = "Hubo un error, no se agregaron puntos a tu cuenta"
      end
    else
      flash[:notice] = "Hay un error en el número o el código de la tarjeta"
      render 'edit'
    end


  end

end
