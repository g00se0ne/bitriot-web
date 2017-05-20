class CreateServiceSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :service_segments do |t|
      t.string :name
      t.string :image
      t.belongs_to :service
      t.timestamps
    end
  end
end
