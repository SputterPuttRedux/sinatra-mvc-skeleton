class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :complete, default: false
      t.references :user

      t.timestamps
    end
  end
end
