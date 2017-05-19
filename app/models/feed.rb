class Feed < ApplicationRecord
  has_many :entries
  belongs_to :category
end
