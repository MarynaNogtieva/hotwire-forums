class Category < ApplicationRecord
  has_many :discussions, dependent: :nullify

  scope :sorted, -> { order(name: :asc) }
  
  after_create_commit -> { broadcast_prepend_to 'categories' }
end
