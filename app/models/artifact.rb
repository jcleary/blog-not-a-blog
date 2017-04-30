class Artifact < ApplicationRecord
  belongs_to :user
  has_many :collection_artifacts, dependent: :destroy
  has_many :collections, through: :collection_artifacts
end
