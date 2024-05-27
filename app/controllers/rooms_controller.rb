class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  def new
    @room  = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:facilityname, :facilitypic, :facilityintroduction, :cost, :address))
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @rooms = Room.search(params[:keyword])
    @keyword = params[:keyword]
    render "result"
  end

end
