class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :profile_picture
      t.string :social_media_id
      t.boolean :is_seller

      t.timestamps
    end
  end
end
