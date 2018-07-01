class AddUserToRegistros < ActiveRecord::Migration[5.1]
  def change
    add_reference :registros, :user, foreign_key: true
  end
end
