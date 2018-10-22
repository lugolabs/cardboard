class CreateCardLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :card_labels, id: :uuid do |t|
      t.references :card, type: :uuid, null: false, foreign_key: true
      t.references :label, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
