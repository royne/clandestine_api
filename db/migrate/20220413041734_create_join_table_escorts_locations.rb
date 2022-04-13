class CreateJoinTableEscortsLocations < ActiveRecord::Migration[6.1]
  def change
    create_join_table :escorts, :locations
  end
end
