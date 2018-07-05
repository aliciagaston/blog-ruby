class AddImageToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :uploader, :string
    add_column :posts, :file, :string
  end
end
