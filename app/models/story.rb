class Story < ActiveRecord::Base
  belongs_to :person
  attr_accessible :content, :title

  validates_presence_of :title, :content
  validates_associated :person
end

