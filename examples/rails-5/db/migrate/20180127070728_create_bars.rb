class CreateBars < ActiveRecord::Migration[5.1]
  def change
    create_table :bars do |t|
      t.string :widget
      t.boolean :sprocket
      t.integer :crank

      t.timestamps
    end
  end
end
