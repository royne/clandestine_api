class AddColumnVisitCounterToEscorts < ActiveRecord::Migration[6.1]
  def change
    add_column :escorts, :visit_counter, :integer, default: 0
  end
end
