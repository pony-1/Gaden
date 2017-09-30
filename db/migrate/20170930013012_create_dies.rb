class CreateDies < ActiveRecord::Migration
  def change
    create_table :dies do |t|
      t.integer :age


      t.timestamps null: false
    end
  end
end
