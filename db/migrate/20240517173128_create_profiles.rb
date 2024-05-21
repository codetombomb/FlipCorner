class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :bio
      t.string :location
      t.string :contact_info

      t.timestamps
    end
  end
end
