class AddReleaseFieldsToSongs < ActiveRecord::Migration[7.1]
  def change
    add_column :songs, :coming_soon, :boolean, default: false, null: false
    add_column :songs, :release_date, :datetime
  end
end

