class Page < ActiveRecord::Base
  validates :slug, uniqueness: true, presence: true
end
