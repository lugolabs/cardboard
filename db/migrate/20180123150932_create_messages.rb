class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :card, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
