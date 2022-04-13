class CreateEscorts < ActiveRecord::Migration[6.1]
  def change
    create_table :escorts do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :city
      t.text :description
      t.integer :price
      t.integer :stars
      t.integer :sex
      t.integer :age
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
