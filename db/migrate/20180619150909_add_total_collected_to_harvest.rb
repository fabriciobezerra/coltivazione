class AddTotalCollectedToHarvest < ActiveRecord::Migration[5.2]
  def change
    add_column :harvests, :total_collected, :integer
  end
end
