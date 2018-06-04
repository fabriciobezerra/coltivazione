class CreateHarvests < ActiveRecord::Migration[5.2]
  def change
    create_table :harvests do |t|
      t.string :seed
      t.date :initial_date
      t.date :end_date_prediction
      t.string :employee

      t.timestamps
    end
  end
end
