class CreateUses < ActiveRecord::Migration
  def change
    create_table :uses do |t|
      t.references :tech, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
