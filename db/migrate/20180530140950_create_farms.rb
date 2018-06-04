class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.string :size
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
