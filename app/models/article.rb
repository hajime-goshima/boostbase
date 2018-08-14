class Article < ApplicationRecord
  validates :title, presence: true

  has_many :article_tag_assocs
  has_many :tags, through: :article_tag_assocs

  belongs_to :category, optional: true
end
