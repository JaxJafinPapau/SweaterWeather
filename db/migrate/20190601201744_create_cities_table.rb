class CreateCitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
