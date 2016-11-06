class AgregarIdsAPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :usuario_id, :integer
  end
end
