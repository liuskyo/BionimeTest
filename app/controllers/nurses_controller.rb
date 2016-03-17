class NursesController < ApplicationController
	def index
		@nurses = Nurse.all
	end

	def show
		@nurse = Nurse.find(params[:id])
		@stations_add = @nurse.stations
		if @stations_add.size>0
			@stations = Station.where("id NOT IN (?)", @stations_add.ids)
		else
			@stations = Station.all
		end
		if params[:c]
			@stations_add = Station.find(params[:c])
			@stations = Station.where("id NOT IN (?)", params[:c])
	  end		
	end

	def new
		@nurse = Nurse.new
		@stations = Station.all
		if params[:c]
			@stations_add = Station.find(params[:c])
			session[:station_id]=@stations_add

			@stations = Station.where("id NOT IN (?)", params[:c])
	  end
	  respond_to do |format|
	  	format.html
	  	format.js
	  end
	end

	def create
		@nurse = Nurse.new(nurse_params)
		if @nurse.save
			if(session[:station_id])
				session[:station_id].each do |s|		
		  		@nurse.station_nurseships.create(:station_id=>s["id"])
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
		if(params[:s])
			@nurse.station_nurseships.delete_all
			params[:s].each do |s|
				@nurse.station_nurseships.create(:station_id=>s)
			end
		end	
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
