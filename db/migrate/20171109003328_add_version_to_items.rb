class AddVersionToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :version, :integer
  end
end
