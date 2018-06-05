class AddFarmReferenceToHarvest < ActiveRecord::Migration[5.2]
  def change
    add_reference :harvests, :farm, foreign_key: true
  end
end
