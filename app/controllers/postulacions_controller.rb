class PostulacionsController < ApplicationController

  def new
    @postulacion=Postulacion.new(gauchada_id:params[:gauchadaid])

  end

  def default
  end

  def index
    @postulaciones=Postulacion.all
  end

  def show
    @postulacion = Postulacion.find(params[:id])
  end

  def create
      @postulacion= Postulacion.new(params.require(:postulacion).permit(:fechaderealizacion, :comentarios, :gauchada_id))
     @postulacion.user=current_user
    if @postulacion.save
         flash[:notice] = "Se ha postulado correctamente"
    else
     if @postulacion.fechaderealizacion >= Date.today
       @postulacion.user=current_user
       if @postulacion.save
           flash[:notice] = "Se ha postulado correctamente"
          redirect_to @postulacion.gauchada
        else
          flash[:notice] = "No se pudo postular correctamente"
          render 'new'
       end
      else
       flash[:notice] = "Ingrese una fecha válida"
       render 'new'
      end
    end
     redirect_to @postulacion.gauchada
  end
end
