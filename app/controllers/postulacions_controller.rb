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
    validates :comentarios, :presence => true
    @postulacion.user=current_user
    if @postulacion.save
        flash[:notice] = "Se ha postulado correctamente"
    else
        flash[:notice] = "No se pudo postular correctamente"
        render 'new'
    end
   redirect_to @postulacion.gauchada
   end

   def destroy
       @postulacion= Postulacion.find(params[:id])
         flash[:notice] = "Postulacion eliminada"
         @postulacion.destroy
        redirect_to @postulacion.gauchada
  end
end
