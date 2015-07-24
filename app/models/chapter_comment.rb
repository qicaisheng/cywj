class ChapterComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :novel
  belongs_to :chapter
  validates :content, presence: true
end
