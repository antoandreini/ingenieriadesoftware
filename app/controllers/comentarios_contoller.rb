class ComentariosController < ApplicationController

  def new
  end

  def default
  end

  def index
      @comentarios=Comentario.all
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def create
    @comentario =Comentario.new(params.require(:comentario).permit(:descripcion,:user_id, :gauchada_id))
    @user =current_user
    @comentario.user_id = @user.id
    @comentario.gauchada_id = @gauchada
    if @comentario.save
      flash[:notice] = "Comentario enviado correctamente"
      redirect_to (gauchadas_path)
    else
      flash[:notice] = "No se pudo enviar el comentario"
      render 'new'
    end
  end


  def new
    @comentario = Comentario.new
  end

  end

  def edit
  
  end


  def update
   
  end

  def destroy
  
  end

  def comentariosdegauchada
    
  end
  end