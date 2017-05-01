class AddSlugToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :slug, :string, after: :name
  end
end
