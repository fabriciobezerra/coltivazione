class AddFinalNotesToHarvest < ActiveRecord::Migration[5.2]
  def change
    add_column :harvests, :final_notes, :text
  end
end
