class LogrosController < ApplicationController
	
  def index
  end


  def destroy
	@logro= Logro.find(params[:id])
  	flash[:notice] = "Logro eliminado"
  	@logro.destroy
    redirect_to(logros_path)
  end


  def show
	@logro = Logro.find(params[:id])
  end


  def new
	@logro = Logro.new

  end
  

 
  def create
	@logro= Logro.new(params.require(:logro).permit(:estado, :puntuacion))
 	if @logro.save
   		flash[:notice] = "Logro creado correctamente"
   		redirect_to (logros_path)
	else
   		flash[:notice] = "No se pudo crear el logro"
   		render 'new'
	end
  end
  

  def edit
	@logro= Logro.find(params[:id])
  end 


  def update
  	@logro= Logro.find(params[:id])
    if @logro.update_attributes(params.require(:logro).permit(:estado, :puntuacion))
     	flash[:notice] = "Logro modificado correctamente"
   		redirect_to (logros_path)
    else
    	flash[:notice] = "No se pudo modificar el logro"
   		render 'edit'
    end
  end
end