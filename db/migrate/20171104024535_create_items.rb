class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price
      t.text :image_data

      t.timestamps
    end
  end
end
