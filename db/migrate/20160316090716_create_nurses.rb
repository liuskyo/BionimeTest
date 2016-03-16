class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
    	t.string :number
    	t.string :name 
      t.timestamps null: false
    end
  end
end
