class Event < ActiveRecord::Base
  attr_accessible :comment, :date, :name, :person
  belongs_to :person
end
