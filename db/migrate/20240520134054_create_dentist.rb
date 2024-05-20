class CreateDentist < ActiveRecord::Migration[7.0]
  def change
    change_column(:dentists, :name, :string)
    end
  end
