class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :facilityname
      t.string :facilitypic
      t.text :facilityintroduction
      t.integer :cost
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
