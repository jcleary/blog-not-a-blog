class Artifact < ApplicationRecord
  belongs_to :user
  has_many :collection_artifacts, dependent: :destroy
  has_many :collections, through: :collection_artifacts

  validates :name, uniqueness: { scope: :user_id, message: 'an article already exists with this title' }

  before_save :default_slug

  def to_param
    slug
  end

  def default_slug
    self.slug = name.parameterize
  end
end
