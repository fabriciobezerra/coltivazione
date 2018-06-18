class AddStateToHarvest < ActiveRecord::Migration[5.2]
  def change
    add_column :harvests, :state, :integer
  end
end
