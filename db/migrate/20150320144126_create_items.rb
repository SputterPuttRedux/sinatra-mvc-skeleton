class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :list
      t.string :content
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
