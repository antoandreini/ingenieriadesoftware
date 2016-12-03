class PreguntasController < ApplicationController

  def new
    @pregunta = Pregunta.new(gauchada_id: params[:gauchadaid])
  end

  def default
  end

  def index
      @preguntas=Pregunta.where(gauchada_id: params[:gauchadaid])
  end

  def show
    @pregunta = Pregunta.find(params[:id])
  end

  def create
    @pregunta =Pregunta.new(params.require(:pregunta).permit(:descripcion,:gauchada_id))
    @user =current_user
    @pregunta.user_id = @user.id
    @pregunta.gauchada_id = @gauchada
    if @pregunta.save
      flash[:notice] = "Comentario enviado correctamente"
      redirect_to @pregunta.gauchada
    else
      flash[:notice] = "No se pudo enviar el comentario"
      render 'new'
    end
  end


  def edit

  end


  def update

  end

  def destroy

  end


end
