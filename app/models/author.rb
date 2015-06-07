class Author < ActiveRecord::Base
  belongs_to :user
  has_many :novels
  validates :mobile, presence: true
  validates :job, presence: true
  validates :major, presence: true
  validates :description, presence: true
end
