class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :route, index: true, foreign_key: true, null: false
      t.date :date_start, null: false
      t.integer :count_days, null: false
      t.float :add_pay, null: false, scale: 2
      t.text :add_description, null: false

      t.timestamps null: false
    end
  end
end
