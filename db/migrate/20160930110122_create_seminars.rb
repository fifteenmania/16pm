class CreateSeminars < ActiveRecord::Migration[5.0]
  def change
    create_table :seminars do |t|
      t.string "category", index: true, null: false, default: "regular"
      t.string "title"
      t.string "speecher"
      t.text "content"
      t.date "date"
      t.timestamps
    end
  end
end
