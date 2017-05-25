class EventsController < ApplicationController
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
	def show
		@event = Event.find(params[:id])
	end
	def index
		@events = Event.all
	end
	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			flash.now[:notice] = "Updated!"
		else
			flash.now[:alert] = "Not updated!"
			render "edit"
		end
		
	end
	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		flash[:alert] = " Deleted"
		redirect_to events_url
	end




	private
	def event_params
	  params.require(:event).permit(:title, :description, :start_time, :end_time, :location, :venue)
	end
end
