class PreguntasController < ApplicationController

  def new
  end

  def default
  end

  def index
      @preguntas=Pregunta.all
  end

  def show
    @pregunta = Pregunta.find(params[:id])
  end

  def create
    @pregunta =Pregunta.new(params.require(:pregunta
      ).permit(:descripcion,:gauchada_id))
    @user =current_user
    @pregunta.user_id = @user.id
    @pregunta.gauchada_id = @gauchada
    if @pregunta.save
      flash[:notice] = "Comentario enviado correctamente"
      redirect_to (gauchadas_path)
    else
      flash[:notice] = "No se pudo enviar el comentario"
      render 'new'
    end
  end


  def new
    @pregunta = Pregunta.new(gauchada_id:params[:gauchadaid])
  end

  def edit
  
  end


  def update
   
  end

  def destroy
  
  end


end