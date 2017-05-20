class Feed < ApplicationRecord
  has_many :entries, dependent: :delete_all
  belongs_to :category
end
