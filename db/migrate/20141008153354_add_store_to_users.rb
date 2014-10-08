class AddStoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :store, :boolean, default: false
  end
end
