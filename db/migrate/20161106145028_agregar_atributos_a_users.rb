class AgregarAtributosAUsers < ActiveRecord::Migration
  def change
      add_column :users, :fecha_nac, :date
      add_column :users, :administrador, :boolean
      add_column :users, :nombre, :string
      add_column :users, :apellido, :string
      add_column :users, :puntuacion, :integer
      add_column :users, :telefono, :string
      add_column :users, :ubicacion, :string
      add_column :users, :imagen, :string
  end
end
