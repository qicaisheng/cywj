class Author < ActiveRecord::Base
  resourcify
  belongs_to :user
  has_many :novels
  validates :mobile, :job, :major, :description, presence: true
end
