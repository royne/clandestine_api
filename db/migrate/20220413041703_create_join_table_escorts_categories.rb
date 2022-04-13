class CreateJoinTableEscortsCategories < ActiveRecord::Migration[6.1]
  def change
    create_join_table :escorts, :categories
  end
end
