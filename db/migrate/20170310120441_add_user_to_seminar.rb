class AddUserToSeminar < ActiveRecord::Migration[5.0]
  def change
    add_reference :seminars, :user, index: true, foreign_key: true
  end
end
