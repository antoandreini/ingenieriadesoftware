class CreateLogros < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.integer :puntuacion
      t.string :estado

      t.timestamps null: false
    end
  end
end
