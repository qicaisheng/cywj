class Novel < ActiveRecord::Base
  resourcify
  belongs_to :author
  has_many :chapters
  has_many :chapter_comments
  validates :name, :type, :cover, :keywords, :description, presence: true
  mount_uploader :cover, CoverUploader
  private

  def self.inheritance_column
    nil
  end  
end
