class DefaultGauchadapoints < ActiveRecord::Migration
  def up
    change_column :users, :puntos_para_gauchadas, :integer, :default => 1
  end
  def down
    change_column :users, :puntos_para_gauchadas, :integer, :default => nil
  end
end
