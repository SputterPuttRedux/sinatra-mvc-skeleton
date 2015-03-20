class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :complete, :boolean, default: false
      t.references :user

      t.timestamps
    end
  end
end
