class RemovePiandaimaIdToTollstations < ActiveRecord::Migration
  def change
    remove_column :tollstations, :pianqudaima_id, :integer
  end
end
