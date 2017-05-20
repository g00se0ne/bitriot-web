class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :slug, unique: true
      t.string :image
      t.string :hero_image
      t.text :short_description
      t.text :description

      t.belongs_to :service
      t.timestamps
    end
  end
end
