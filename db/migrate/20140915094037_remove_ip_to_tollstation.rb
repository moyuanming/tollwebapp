class RemoveIpToTollstation < ActiveRecord::Migration
  def change
  	remove_column :tollstations, :oldnetwork ,:string                  
    remove_column :tollstations, :oldplaza   ,:string             
    remove_column :tollstations, :oldip      ,:string          
    remove_column :tollstations, :newnetwork ,:string               
    remove_column :tollstations, :newplaza   ,:string             
    remove_column :tollstations, :newip      ,:string     

  end
end
