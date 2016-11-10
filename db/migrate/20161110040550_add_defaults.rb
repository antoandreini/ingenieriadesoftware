class AddDefaults < ActiveRecord::Migration
  def change
    change_column :users, :administrador, :boolean, :default => false
    change_column :users, :puntuacion, :integer, :default => 0
    remove_column :users, :fecha_nac
    add_column :users, :edad, :integer
    change_column :gauchadas, :cumplida, :boolean, :default => false
  end
end
