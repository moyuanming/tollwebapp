class AddPianqudaimaidToGljdaimas < ActiveRecord::Migration
  def change
    add_column :gljdaimas, :pianqudaima_id, :integer
  end
end
