class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
      t.references :city, index: true, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false
      t.float :price, null: false, scale: 2

      t.timestamps null: false
    end
  end
end
