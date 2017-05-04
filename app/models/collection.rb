class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_artifacts, dependent: :destroy
  has_many :artifacts, through: :collection_aftifacts

  def to_param
    slug
  end
end
