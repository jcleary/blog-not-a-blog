class CreateColletionArtifacts < ActiveRecord::Migration[5.0]
  def change
    create_table :colletion_artifacts do |t|
      t.references :collection
      t.references :artifact

      t.timestamps
    end
  end
end
