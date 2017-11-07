class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
