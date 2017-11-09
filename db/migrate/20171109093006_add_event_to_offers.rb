class AddEventToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :event, :string
  end
end
