class CreateHandingTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :handing_times do |t|

      t.timestamps
    end
  end
end
