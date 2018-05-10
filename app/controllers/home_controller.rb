class HomeController < ApplicationController
  def index
    @events = Event.all
    @q = Event.ransack(params[:q])
    @events = @q.result
  end
end
