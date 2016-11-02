class GauchadasController < ApplicationController
  def new
  end

  def default
  end

  def index
<<<<<<< HEAD
      @gauchadas=Gauchada.all
  end

  def show
    @gauchada = Gauchada.find(params[:id])
    if (@gauchada.postulaciones.count == 0)
       redirect_to(gauchadas_path, notice:"No tiene postulaciones")
     end
  end

  def create
# El método create recibe params = { gauchada: { titulo: string, fecha: string, descripcion: string, foto, cumplida: boolean } }
  @tweet =Tweet.create(params.require(:gauchada).permit(:titulo,:fecha,:descripcion,:foto,:cumplida))
  redirect_to(gauchadas_path)
=======
  end

  def show
>>>>>>> 9d7bf3d232295e2188d07ee16e1159117379bd66
  end
end
