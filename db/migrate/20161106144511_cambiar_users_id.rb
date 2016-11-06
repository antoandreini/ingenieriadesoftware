class CambiarUsersId < ActiveRecord::Migration
  def change
    rename_column :gauchadas, :usuario_id, :user_id
    rename_column :pregunta, :usuario_id, :user_id
    rename_column :pagos, :usuario_id, :user_id
  end
end
