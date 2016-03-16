class StationNurseship < ActiveRecord::Base
	belongs_to :station
	belongs_to :nurse
end
