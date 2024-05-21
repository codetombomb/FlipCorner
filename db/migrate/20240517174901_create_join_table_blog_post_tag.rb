class CreateJoinTableBlogPostTag < ActiveRecord::Migration[7.1]
  def change
    create_join_table :blog_posts, :tags do |t|
      t.index [:blog_post_id, :tag_id]
      t.index [:tag_id, :blog_post_id]
    end
  end
end
