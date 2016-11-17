class GauchadasController < ApplicationController
  def new
  end

  def default
  end

  def index
    @q = params[:q]
    if ! params[:q].present?
       @gauchadas=Gauchada.all
     else
       @gauchadas = Gauchada.titulo.where(:titulo => @q)
       @gauchadas = Gauchada.where(:ubicacion => @q)
       @gauchadas = Gauchada.descripcion.where(:descripcion => @q)
    end
  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def create
# El método create recibe params = { gauchada: { titulo: string, ubicacion: string, descripcion: string, foto } }
  @gauchada =Gauchada.new(params.require(:gauchada).permit(:titulo,:ubicacion,:descripcion,:imagen,:user_id))
  @gauchada.user_id=current_user.id
  if @gauchada.save
      flash[:notice] = "Gauchada creada correctamente"
      redirect_to (gauchadas_path)
  else
      flash[:notice] = "No se pudo crear la gauchada"
      render 'new'
  end
  end

  def new
  @gauchada = Gauchada.new


  end

  def edit
  @gauchada= Gauchada.find(params[:id])
  end


  def update
    @gauchada= Gauchada.find(params[:id])
    if @gauchada.update_attributes(params.require(:gauchada).permit(:titulo,:ubicacion,:descripcion,:imagen))
      flash[:notice] = "Gauchada modificada correctamente"
      redirect_to (gauchadas_path)
    else
      flash[:notice] = "No se pudo modificar la gauchada"
      render 'edit'
    end
  end

  def destroy
    @gauchada= Gauchada.find(params[:id])
      flash[:notice] = "Gauchada eliminada"
      @gauchada.destroy
    redirect_to(gauchadas_path)
  end

  def misgauchadas
    @gauchadas=Gauchada.where(user_id: current_user.id)
  end
end
