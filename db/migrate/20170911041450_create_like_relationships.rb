class CreateLikeRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :like_relationships do |t|
      t.integer :admirer_id
      t.integer :like_id

      t.timestamps
    end
    add_index :like_relationships, :admirer_id
    add_index :like_relationships, :like_id
    add_index :like_relationships, [:admirer_id, :like_id], unique: true
  end
end
