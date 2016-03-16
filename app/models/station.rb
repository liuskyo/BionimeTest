class Station < ActiveRecord::Base
	has_many :station_nurseships
	has_many :nurses,:through=>:station_nurseships
end
