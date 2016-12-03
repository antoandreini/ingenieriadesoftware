class ComentariosController < ApplicationController

  def new
  end

  def default
  end

  def index
      @comentario=Comentario.all
      @comentarios=@comentarios.where() if params[:query]
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def create
# El método create recibe params = { comentario}
    @comentario =Comentario.new(params.require(:comentario))
    @user =current_user
    @comentario.user_id = @user.id
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

  

  def edit
  @comentario= Comentario.find(params[:id])
  end


  def update

  end

  def destroy
  end

end
