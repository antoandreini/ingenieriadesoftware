class AgregarIdsAPregunta < ActiveRecord::Migration
  def change
    add_column :pregunta, :gauchada_id, :integer
    add_column :pregunta, :usuario_id, :integer
  end
end
