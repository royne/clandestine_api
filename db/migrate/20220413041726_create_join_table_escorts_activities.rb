class CreateJoinTableEscortsActivities < ActiveRecord::Migration[6.1]
  def change
    create_join_table :escorts, :activities
  end
end
