class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
