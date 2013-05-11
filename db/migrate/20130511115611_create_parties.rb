class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :description
      t.string :owner
      t.string :location
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
