class AddPositionToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :position, :integer, default: 0
  end
end
