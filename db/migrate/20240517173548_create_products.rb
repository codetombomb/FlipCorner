class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :category
      t.string :tags
      t.string :price
      t.string :condition

      t.timestamps
    end
  end
end
