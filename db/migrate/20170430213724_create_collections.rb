class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.references :user
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
