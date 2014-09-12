class CreateGljdaimas < ActiveRecord::Migration
  def change
    create_table :gljdaimas do |t|
      t.string :name
      t.string :no
      t.string :desc

      t.timestamps
    end
  end
end
