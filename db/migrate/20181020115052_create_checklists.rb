class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists, id: :uuid do |t|
      t.references :card, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid
      t.text :title

      t.timestamps
    end
  end
end
