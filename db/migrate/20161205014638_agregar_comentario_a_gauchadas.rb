class AgregarComentarioAGauchadas < ActiveRecord::Migration
  def change
	add_column :gauchadas, :comentariocal, :string 
  end
end
