class AgregarIdsAPostulacions < ActiveRecord::Migration
  def change
    add_column :postulacions, :gauchada_id, :integer
  end
end
