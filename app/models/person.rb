class Person < ActiveRecord::Base
  attr_accessible :name, :surname

  has_many :events
  accepts_nested_attributes_for :events, :allow_destroy => true
  attr_accessible :events_attributes


  def fullname
    "#{name} #{surname}"
  end

end
