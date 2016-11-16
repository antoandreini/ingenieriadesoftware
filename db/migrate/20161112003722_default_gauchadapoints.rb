class DefaultGauchadapoints < ActiveRecord::Migration
  def change
    change_column :users, :puntos_para_gauchadas, :integer, :default => 1
  end
end
