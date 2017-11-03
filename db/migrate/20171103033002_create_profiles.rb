class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.text :avatar_data
      t.text :about_me
      t.string :first_name
      t.string :last_name
      t.string :username
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
