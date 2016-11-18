class PostulacionsController < ApplicationController

  def new
    @postulacion=Postulacion.new(gauchada_id:params[:gauchadaid])

  end

  def default
  end

  def index
    @postulaciones=Postulacion.all
    @postulacions=@postulacions.where() if params[:query]
  end

  def show
    @postulacion = Postulacion.find(params[:id])
  end

  def create
    @postulacion= Postulacion.new(params.require(:postulacion).permit(:fechaderealizacion, :comentarios, :gauchada_id))
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

   def destroy
       @postulacion= Postulacion.find(params[:id])
         flash[:notice] = "Postulacion eliminada"
         @postulacion.destroy
        redirect_to @postulacion.gauchada
  end
end
