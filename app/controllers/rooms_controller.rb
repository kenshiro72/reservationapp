class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @user = current_user
    @room = Room.new(params.require(:room).permit(:facilityname, :facilitypic, :facilityintroduction, :cost, :address, :user_id))
    if @room.save
      redirect_to rooms_path
    else
      render new_room_path
    end
  end

  def show
    @room = Room.find(params[:id])
    @user = current_user
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_index_path
  end

  def search
    puts @subject
    if params[:subject] == "free"
      @rooms = Room.search(params[:keyword])
      @keyword = params[:keyword]
    elsif params[:subject] == "area"
      @rooms = Room.search_by_area(params[:keyword])
      @keyword = params[:keyword]
    elsif params[:subject] == "Tokyo"
      @rooms = Room.search_by_area("東京")
    elsif params[:subject] == "Osaka"
      @rooms = Room.search_by_area("大阪")
    elsif params[:subject] == "Kyoto"
      @rooms = Room.search_by_area("京都")
    elsif params[:subject] == "Sapporo"
      @rooms = Room.search_by_area("札幌")
    end
    if @rooms.count == 0
      @rooms = Room.all
    end
    render "result"
  end
end
