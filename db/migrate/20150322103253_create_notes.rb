class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user
      t.text :content
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
