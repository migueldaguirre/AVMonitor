class CreateTrms < ActiveRecord::Migration[5.1]


  def change
    create_table :trms do |t|
      t.float :dollar

      t.timestamps
    end
  end
end
