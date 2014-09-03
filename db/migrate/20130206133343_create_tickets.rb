class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
        t.references :user
        t.references :project
        t.references :status
        t.string "name", :limit => 40
        t.string "description", :limit => 100
      t.timestamps
    end
  end
end
