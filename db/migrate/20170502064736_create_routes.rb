class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.references :city, index: true, foreign_key: true, null: false
      t.text :description, null: false
      t.float :price, null: false, scale: 2

      t.timestamps null: false
    end
  end
end
