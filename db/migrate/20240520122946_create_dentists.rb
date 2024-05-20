class CreateDentists < ActiveRecord::Migration[7.0]
  def change
    create_table :dentists do |t|
      t.string :name
      t.boolean :registration_status
      t.date :registered_since

      t.timestamps
    end
  end
end
