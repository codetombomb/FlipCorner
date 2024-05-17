class CreateBlogPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :tags

      t.timestamps
    end
  end
end
