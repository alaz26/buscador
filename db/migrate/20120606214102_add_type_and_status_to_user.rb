class AddTypeAndStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :integer
    add_column :users, :status, :boolean
  end
end
