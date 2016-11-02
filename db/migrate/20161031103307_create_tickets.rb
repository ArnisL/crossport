class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.timestamps null: false
    end
  end
end
