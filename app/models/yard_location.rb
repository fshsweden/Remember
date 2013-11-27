class YardLocation < ActiveRecord::Base
	#set_table_name "yardlocations"
	attr_accessible :place_id, :yard_id
	belongs_to :yard
	belongs_to :place
end
