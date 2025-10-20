class AddAssetImageNameToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :asset_image_name, :string
  end
end

