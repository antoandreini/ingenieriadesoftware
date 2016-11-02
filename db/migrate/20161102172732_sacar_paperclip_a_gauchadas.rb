class SacarPaperclipAGauchadas < ActiveRecord::Migration
  def change
    remove_column :gauchadas, :foto_file_name
    remove_column :gauchadas, :foto_content_type
    remove_column :gauchadas, :foto_file_size
    remove_column :gauchadas, :foto_updated_at
    add_column :gauchadas, :imagen, :string
  end
end
