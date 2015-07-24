class Novel < ActiveRecord::Base
  resourcify
  belongs_to :author
  has_many :chapters
  has_many :chapter_comments
  validates :name, :type, :cover, :keywords, :description, presence: true
  mount_uploader :cover, CoverUploader

  def keywords_array
    if self.keywords.include? '，'
      return self.keywords.split('，')
    elsif self.keywords.include? ','
      return self.keywords.split(',')
    elsif self.keywords.include? '、'
      return self.keywords.split('、')
    elsif self.keywords.include? '/'
      return self.keywords.split('/')
    else
      return self.keywords.split()
    end
  end

  private

  def self.inheritance_column
    nil
  end  
end
