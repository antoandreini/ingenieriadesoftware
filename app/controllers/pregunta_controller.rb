class PreguntaController < ApplicationController

  def new
    @pregunta = Preguntum.new(gauchada_id: params[:gauchadaid])
  end

  def default
  end

  def index
      @preguntas=Preguntum.where(gauchada_id: params[:gauchadaid])
  end

  def show
    @pregunta = Preguntum.find(params[:id])
  end

  def create
    @pregunta =Preguntum.new
    @user = current_user
    @pregunta.user_id = @user.id
    @pregunta.gauchada_id = params[:gauchada_id]
    @pregunta.cuerpo = params[:cuerpo]
    @pregunta.fecha = Date.today
    if @pregunta.save
      flash[:notice] = "Comentario enviado correctamente"
      redirect_to @pregunta.gauchada
    else
      flash[:notice] = "No se pudo enviar el comentario"
      redirect_to @pregunta.gauchada
    end
  end
  def responder
    @pregunta = Preguntum.find(params[:id])
    @pregunta.respuesta = params[:respuesta]
    if @pregunta.save
      flash[:notice] = "Respuesta enviada correctamente"
      redirect_to @pregunta.gauchada
    else
      flash[:notice] = "No se pudo enviar la respuesta"
      redirect_to @pregunta.gauchada
    end
  end


  def edit

  end


  def update

  end

  def destroy

  end


end
