class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.string "name", :limit => 40
      t.string "description", :limit => 100
      t.datetime "start_date"
      t.datetime "end_date"
      t.timestamps
    end
  end
end
