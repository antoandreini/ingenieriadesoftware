class Modificar < ActiveRecord::Migration
  def change
    drop_table :usuarios
    remove_column :gauchadas, :fecha
    add_column :users, :numero_tarjeta, :integer
    add_column :users, :puntos_para_gauchadas, :integer
  end
end
