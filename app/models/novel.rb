class Novel < ActiveRecord::Base
  resourcify
  belongs_to :author
  has_many :chapters
  validates :name, :type, :cover, :keywords, :description, presence: true
  private

  def self.inheritance_column
    nil
  end  
end
