class CreateChecklistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :checklist_items, id: :uuid do |t|
      t.references :checklist, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid
      t.string :title
      t.datetime :checked_at

      t.timestamps
    end
  end
end
