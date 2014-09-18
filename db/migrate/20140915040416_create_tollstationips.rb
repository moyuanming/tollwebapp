class CreateTollstationips < ActiveRecord::Migration
  def change
    create_table :tollstationips do |t|
      t.string :oldnetwork
      t.string :oldplaza
      t.string :oldip
      t.string :newnetwork
      t.string :newplaza
      t.string :newip
      t.integer :tollstation_id

      t.timestamps
    end
  end
end
