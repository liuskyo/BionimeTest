class Nurse < ActiveRecord::Base
	has_many :station_nurseships
	has_many :stations,:through=>:station_nurseships
end
