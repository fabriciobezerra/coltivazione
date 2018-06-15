class AddUserReferenceToHarvest < ActiveRecord::Migration[5.2]
  def change
    add_reference :harvests, :user, foreign_key: true
  end
end
