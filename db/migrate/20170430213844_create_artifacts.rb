class CreateArtifacts < ActiveRecord::Migration[5.0]
  def change
    create_table :artifacts do |t|
      t.references :user
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
