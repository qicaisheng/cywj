class Chapter < ActiveRecord::Base
  belongs_to :novel
  has_many :chapter_comments
  validates :number, numericality: { only_integer: true }

  def next_chapter
    Chapter.where("novel_id = ? AND number < ?", self.novel_id, self.number).order(:number).first
  end

  def previous_chapter
    Chapter.where("novel_id = ? AND number < ?", self.novel_id, self.number).order(:number).first
  end  
end
