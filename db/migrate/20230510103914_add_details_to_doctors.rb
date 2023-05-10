class AddDetailsToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :details, :jsonb, default: {}
  end
end
