class AddModelToPermissionsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :permissions, :model, :string
  end
end
