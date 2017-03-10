class CreateSeminarComments < ActiveRecord::Migration[5.0]
  def change
    create_table :seminar_comments do |t|
      t.text "content"
      t.belongs_to :seminar, index: true, null: false
      t.belongs_to :user, index: true, null: false
      t.timestamps
    end
  end
end
