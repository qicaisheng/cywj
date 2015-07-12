class Chapter < ActiveRecord::Base
  belongs_to :novel
  validates :number, numericality: { only_integer: true }
end
