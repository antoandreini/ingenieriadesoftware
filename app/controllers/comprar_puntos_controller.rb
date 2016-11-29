class ComprarPuntosController < ApplicationController

def actualizar
    @user = current_user
    cantidad=(params[:cantidad].to_i)
    puntos=@user.puntos_para_gauchadas+cantidad
    if cantidad == 1
      @monto=2
    else
      if cantidad == 5
        @monto=8
      else
          @monto=12
      end
    end
    if params[:tarjeta].length == 16 && params[:codigo].length== 3 && !!(params[:codigo] =~ /\A[-+]?[0-9]+\z/) && !!(params[:tarjeta] =~ /\A[-+]?[0-9]+\z/)
      @user.puntos_para_gauchadas=puntos
      if @user.save
     	  flash[:notice] = "Se agregaron puntos a tu cuenta"
        @pago=Pago.new
        @pago.monto=@monto
        @pago.user_id=@user.id
        @pago.save
        redirect_to (gauchadas_path)
      else
    	  flash[:notice] = "Hubo un error, no se agregaron puntos a tu cuenta"
      end
    else
      flash[:notice] = "Hay un error en el número o el código de la tarjeta"
      render 'edit'
    end
  end

def reporteusuario
  render 'reporteusuario'
end

def reporteganancia
 render 'reporteganancia'
 end

 def buscarpagos
   @fecha1=params[:fechadesde]
   @fecha2=params[:fechahasta]
   @pagos=Pago.where("created_at >= ? AND created_at <= ?", params[:fechadesde], params[:fechahasta])
   if @pagos.present?
     render 'buscarpagos'
   else
     flash[:notice] = "No se encontraron ganancias"
     redirect_to (gauchadas_path)
   end
  end
end
