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
# El método create recibe params = { gauchada: { titulo: string, fecha: string, descripcion: string, foto, cumplida: boolean } }
  @gauchada =Gauchada.create(params.require(:gauchada).permit(:titulo,:fecha,:descripcion,:foto,:cumplida))
  end
end
