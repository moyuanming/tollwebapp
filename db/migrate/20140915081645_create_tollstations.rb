class CreateTollstations < ActiveRecord::Migration
  def change
    create_table :tollstations do |t|
      t.string :name
      t.string :oldnetwork
      t.string :oldplaza
      t.string :oldip
      t.string :newnetwork
      t.string :newplaza
      t.string :newip
      t.integer :pianqudaima_id
      t.integer :gljdaima_id

      t.timestamps
    end
  end
end
