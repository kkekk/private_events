class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.timestamp :starts_at, null: false
      t.timestamp :ends_at

      t.timestamps
    end
  end
end
