class AddColumnSubscriptionTypeToEscorts < ActiveRecord::Migration[6.1]
  def change
    add_column :escorts, :subscription_type, :integer, default: 0
  end
end
