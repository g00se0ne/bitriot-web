class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :slug, unique: true
      t.string :hero_image
      t.text :short_description
      t.text :description
      t.timestamps
    end
  end
end
