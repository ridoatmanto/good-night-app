class CreateSleepingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :sleeping_times do |t|
      t.integer :user_id
      t.datetime :clock_in
      t.datetime :clock_out
      t.integer :duration_in_minutes

      t.timestamps
    end
  end
end
