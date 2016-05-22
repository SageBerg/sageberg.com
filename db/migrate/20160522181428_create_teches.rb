class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :name
      t.integer :times_used
      t.string :image_ref

      t.timestamps null: false
    end
  end
end
