class CreateFoos < ActiveRecord::Migration[5.1]
  def change
    create_table :foos do |t|
      t.string :widget
      t.boolean :sprocket
      t.integer :crank

      t.timestamps
    end
  end
end
