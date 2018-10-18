class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists, id: :uuid do |t|
      t.references :board, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :title
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
