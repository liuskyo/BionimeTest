class NursesController < ApplicationController
	def index
		@nurses = Nurses.all
	end

	def show
		@nurse = Nurse.find(params[:id])
		@stations = @nurse.stations
	end

	def new
		@nurse = Nurse.new
		@stations = Station.all
		if params[:c]
			@stations_add = Station.find(params[:c])
			@stations = Station.where("id NOT IN (?)", params[:c])
	  end
	end

	def create
		@nurse = Nurse.new(nurse_params)
		if @nurse.save
		if(params[:s])
			params[:s].each do |s|
				@nurse.station_nurseships.create(:station_id=>s)
			end
		end			
			redirect_to nurse_path(@nurse)
		else
			render new_nurse_path
		end
	end

	def edit

	end

	def update
		@nurse = Nurse.find(params[:id])
		@nurse.update(nurse_params)
		redirect_to nurse_path(params[:id])
	end

	def destroy
		@nurse = Nurse.find(params[:id])
		@nurse.destroy

		redirect_to nurses_path
	end

	private

	def nurse_params
		params.require(:nurse).permit(:name,:number,:station_id)
	end
end
