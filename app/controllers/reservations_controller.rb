class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
  end
  def new
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id, :room_id, :reservation_id, :people_number ))
    @reservation.user = current_user
    @room = @reservation.room
    @stay_date = (@reservation.check_out_date - @reservation.check_in_date).to_i
    @reservation.total_price = @room.cost * @reservation.people_number * @stay_date
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date, :check_out_date, :user_id, :room_id, :people_number, :total_price ))
    @room = @reservation.room
    @reservation.save
    redirect_to reservations_path
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
