class CreateJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :journals do |t|
      t.string "title"
      t.datetime "published"
      t.timestamps
    end
  end
end
