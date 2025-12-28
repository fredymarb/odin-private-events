class AddIsPrivateToEvents < ActiveRecord::Migration[8.1]
  def change
    add_column :events, :is_private, :boolean, default: false, null: false
  end
end
