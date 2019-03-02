class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.timestamp :starts_at
      t.timestamp :ends_at

      t.timestamps
    end
  end
end
