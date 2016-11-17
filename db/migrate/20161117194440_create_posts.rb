class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :ubicacion
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
