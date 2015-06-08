class Novel < ActiveRecord::Base
  resourcify
  belongs_to :author
end
