class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.string :cuerpo
      t.date :fecha
      t.string :respuesta

      t.timestamps null: false
    end
  end
end
