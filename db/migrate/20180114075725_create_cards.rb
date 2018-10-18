class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards, id: :uuid do |t|
      t.references :list, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :row_order

      t.timestamps
    end
  end
end
