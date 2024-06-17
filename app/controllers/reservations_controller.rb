class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end
  def new
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id, :room_id, :reservation_id, :people_number ))
    @reservation.user = current_user
    @user = current_user
    @room = @reservation.room
    if @reservation.valid?
      @stay_date = (@reservation.check_out_date - @reservation.check_in_date).to_i
      @reservation.total_price = @room.cost * @reservation.people_number * @stay_date
    else
      render 'rooms/show'
    end
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id, :room_id, :people_number, :total_price ))
    @room = @reservation.room
    if @reservation.save
      redirect_to reservations_path
    else
      render 'rooms/show'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
end
