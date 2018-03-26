class AddPostedImageToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :posted_image_id, :string
    add_column :posts, :posted_image_filename, :string
    add_column :posts, :posted_image_content_size, :string
    add_column :posts, :posted_image_content_type, :string
  end
end
