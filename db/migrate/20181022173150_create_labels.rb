class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels, id: :uuid do |t|
      t.string :color

      t.timestamps
    end
  end
end
