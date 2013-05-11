class DatetimeToDateInParties < ActiveRecord::Migration
  def change
    change_column :parties, :start_at, :date
  end
end
