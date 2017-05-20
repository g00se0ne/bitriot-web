class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :company
      t.string :name
      t.string :email
      t.string :phone

      t.string :business_type
      t.string :project_type
      t.string :platforms
      t.string :budget

      t.string :referral_source

      t.text :body

      t.timestamps
    end
  end
end
