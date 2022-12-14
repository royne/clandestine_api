class AddActiveToEscorts < ActiveRecord::Migration[6.1]
  def change
    add_column :escorts, :active, :boolean, default: false
  end
end
