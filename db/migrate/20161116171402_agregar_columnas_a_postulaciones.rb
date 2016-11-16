class AgregarColumnasAPostulaciones < ActiveRecord::Migration
  def change
    add_column :postulacions, :fechaderealizacion, :date
      add_column :postulacions, :comentarios, :string
      add_column :postulacions, :estado, :string, :default=>"Esperando"

  end
end
