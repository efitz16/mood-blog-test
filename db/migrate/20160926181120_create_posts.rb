class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body, {null: false}
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
