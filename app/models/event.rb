class Event < ActiveRecord::Base
  attr_accessible :comment, :name, :date, :person
  belongs_to :person
end
