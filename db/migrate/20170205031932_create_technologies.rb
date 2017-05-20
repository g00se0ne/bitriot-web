class CreateTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :subtitle
      t.string :slug, unique: true
      t.string :image
      t.string :hero_image

      t.text :short_description
      t.text :description
      t.timestamps
    end
  end
end
