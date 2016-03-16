class Station < ActiveRecord::Base
	validates_presence_of :name
	has_many :station_nurseships
	has_many :nurses,:through=>:station_nurseships
end
