class AgregarIdsAGauchadas < ActiveRecord::Migration
  def change
      add_column :gauchadas, :usuario_id, :integer
  end
end
