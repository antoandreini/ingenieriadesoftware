class SacarPaperclipAUsuarios < ActiveRecord::Migration
  def change
      remove_column :usuarios, :foto_file_name
      remove_column :usuarios, :foto_content_type
      remove_column :usuarios, :foto_file_size
      remove_column :usuarios, :foto_updated_at
      add_column :usuarios, :imagen, :string
  end
end
