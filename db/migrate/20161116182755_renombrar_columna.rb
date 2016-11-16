class RenombrarColumna < ActiveRecord::Migration
  def change
    rename_column :postulacions, :id_usuario, :usuario_id
  end
end
