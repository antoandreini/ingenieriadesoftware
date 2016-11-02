class CreateGauchadas < ActiveRecord::Migration
  def change
    create_table :gauchadas do |t|
      t.string :titulo
      t.string :descripcion
      t.string :ubicacion
      t.boolean :cumplida
      t.date :fecha
      t.attachment :foto

      t.timestamps null: false
    end
  end
end
