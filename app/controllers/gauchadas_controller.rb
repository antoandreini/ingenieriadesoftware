class GauchadasController < ApplicationController

  def new
  end

  def default
  end

  def index
      @gauchadas=Gauchada.all
  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def create
# El método create recibe params = { gauchada: { titulo: string, ubicacion: string, descripcion: string, foto } }
    @gauchada =Gauchada.new(params.require(:gauchada).permit(:titulo,:ubicacion,:descripcion,:imagen,:user_id))
    @user =current_user
    @gauchada.user_id = @user.id
    if @gauchada.save
      @user.puntos_para_gauchadas -=1
      @user.save
      flash[:notice] = "Gauchada creada correctamente"
      redirect_to (gauchadas_path)
    else
      flash[:notice] = "No se pudo crear la gauchada"
      render 'new'
    end
  end


  def new
  if(current_user.puntos_para_gauchadas <= 0)
    flash[:notice] = "No tiene suficientes puntos para pedir una gauchada"
    redirect_to(comprar_puntos_edit_path)
  else
  @gauchada = Gauchada.new
end

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
  def buscar
   @gauchadas = Gauchada.search(params[:search]).order("created_at DESC")
    if @gauchadas.present?
      render 'buscar'
    else
      flash[:notice] = "No se encontraron gauchadas que coincidan con su busqueda"
      redirect_to (gauchadas_path)
    end
  end
  def marcar
    @gauchada= Gauchada.find(params[:id])
    @gauchada.cumplida=true
    if @gauchada.save
        flash[:notice] = "Gauchada marcada como cumplida"
        redirect_to (gauchadas_path)
    else
        flash[:notice] = "No se pudo marcar la gauchada como cumplida"
        redirect_to (gauchadas_path)
    end
  end
end