class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :step
      t.belongs_to :receipe, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
