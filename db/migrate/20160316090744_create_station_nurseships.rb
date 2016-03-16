class CreateStationNurseships < ActiveRecord::Migration
  def change
    create_table :station_nurseships do |t|
    	t.integer :station_id,:index=>true
    	t.integer :nurse_id,:index=>true
      t.timestamps null: false
    end
  end
end
