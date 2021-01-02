class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :title
      t.integer :weight
      t.integer :times
      t.integer :set
      t.text :memo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :memos, [:user_id, :created_at]
  end
end
