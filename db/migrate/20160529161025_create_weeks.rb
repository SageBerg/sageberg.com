class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :name
      t.decimal :work_hours
      t.string :work_desc
      t.decimal :leisure_tech_hours
      t.string :leisure_desc

      t.timestamps null: false
    end
  end
end
