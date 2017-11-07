class AddDetailToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :detail, :text
  end
end
