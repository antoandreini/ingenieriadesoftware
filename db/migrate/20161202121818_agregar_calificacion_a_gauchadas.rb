class AgregarCalificacionAGauchadas < ActiveRecord::Migration
  def change
  	  add_column :gauchadas, :calificacion, :string
  end
end
