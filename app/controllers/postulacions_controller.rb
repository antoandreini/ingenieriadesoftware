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
  def aceptar
    @postulacion= Postulacion.find(params[:id])
    @postulacion.estado= "Aceptada"
    if @postulacion.save
        postulaciones = @postulacion.gauchada.postulacions - [@postulacion]
        postulaciones.each { |p| p.update(estado: "Rechazada") }
        EnviarDatos.datos_postulante(@postulacion).deliver_now
        EnviarDatos.datos_usuario(@postulacion).deliver_now
        flash[:notice] = "Postulación aceptada. En breve vas a recibir un mail con los datos del postulante!"
    end
    redirect_to @postulacion.gauchada
  end
  def rechazar
    @postulacion= Postulacion.find(params[:id])
    @postulacion.estado= "Rechazada"
    @postulacion.save
    flash[:notice] = "Postulación rechazada"
    redirect_to @postulacion.gauchada
  end
end
