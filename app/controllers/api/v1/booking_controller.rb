class Api::V1::BookingController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token, :require_login
  def index

  end


  def create
    #Create a new Object of the Booking Master Class
    booking_master = BookingMaster.new(booking_params)
    # we will call before_save method in the model to check the user exist or not if user not exist we will create and
    #if user exist that booking will be associated to that user
    if booking_master.save
      render :json=> {
          :success => true
      }
      return
    else
      render :json => {:success => false, :message => booking_master.errors.full_messages }
    end

  end
  def booking_params
    params.require(:booking).permit(
        :booking_type,
        :check_in_date,
        :check_out_date,
        :num_of_adults,
        :num_of_children,
        :hotel_id,
        :email,
        :name,
        :addtional_instructions
    )
  end

end