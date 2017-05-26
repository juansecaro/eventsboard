class EventsController < ApplicationController
before_action :set_event, only: [:show, :edit, :update, :destroy]

	def show

	end
	def index
		@events = Event.all
	end
	def new
		@event = Event.new
	end
	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "Event created"
			redirect_to @event
		else
			flash.now[:alert] = "Event not created"
			render "new"
		end
	end

	def edit

	end
	def update


		if @event.update(event_params)
			flash.now[:notice] = "Updated!"
		else
			flash.now[:alert] = "Not updated!"
			render "edit"
		end

	end
	def destroy

		@event.destroy
		flash.alert = " Deleted"
		redirect_to events_url
	end




	private
	def event_params
	  params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :venue)
	end
	def set_event
		@event = Event.find(params[:id])

	rescue ActiveRecord::RecordNotFound
		flash.alert = "The page does not exist"
		redirect_to events_path
	end
end
