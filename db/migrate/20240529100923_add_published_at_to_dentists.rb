class AddPublishedAtToDentists < ActiveRecord::Migration[7.0]
  def change
    add_column :dentists, :published_at, :datetime
  end
end
