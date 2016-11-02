class CreatePostulacions < ActiveRecord::Migration
  def change
    create_table :postulacions do |t|
      t.integer :id_usuario

      t.timestamps null: false
    end
  end
end
