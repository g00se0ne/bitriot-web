class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug, unique: true
      t.string :subtitle
      t.text :what
      t.text :how
      t.string :quote

      t.string :hero_image
      t.string :homepage_image
      t.string :primary_image
      t.string :secondary_image

      t.boolean :published
      t.datetime :published_at
      t.integer :position

      t.belongs_to :package

      t.string :template_name
      t.timestamps
    end
  end
end
