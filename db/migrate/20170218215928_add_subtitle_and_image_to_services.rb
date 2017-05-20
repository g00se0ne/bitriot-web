class AddSubtitleAndImageToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :image, :string
    add_column :services, :subtitle, :string
  end
end
