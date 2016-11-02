class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.boolean :administrador
      t.string :nombre
      t.string :apellido
      t.integer :puntuacion
      t.string :telefono
      t.date :fechaNac
      t.string :ubicacion
      t.attachment :foto
      t.string :email

      t.timestamps null: false
    end
  end
end
