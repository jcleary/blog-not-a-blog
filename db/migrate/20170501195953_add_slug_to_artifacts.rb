class AddSlugToArtifacts < ActiveRecord::Migration[5.0]
  def change
    add_column :artifacts, :slug, :string, after: :name
  end
end
