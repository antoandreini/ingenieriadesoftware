class RenombrarColumna2 < ActiveRecord::Migration
  def change
      rename_column :postulacions, :usuario_id, :user_id
  end
end
