class CreateCommentRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :comment_relationships do |t|
      t.text :content
      t.integer :author_id
      t.integer :post_id

      t.timestamps
    end
    add_index :comment_relationships, :author_id
    add_index :comment_relationships, :post_id
  end
end
