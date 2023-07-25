module BxBlockBookingDetails
  class BookingDetailsController < ApplicationController
    # before_action :set_user
    skip_before_action :verify_authenticity_token

    def index
      # debugger
      @user = User.find_by(id: params[:user_id])

      @booking_details = @user.booking_details
      render json: @booking_details
    end 

    def create
      @user = User.find_by(id: params[:user_id])
      @booking_detail = @user.booking_details.build(booking_detail_params)
      if @booking_detail.save
        render json: @booking_detail, status: :created
      else
        render json: @booking_detail.errors, status: :unprocessable_entity
      end
    end

 
    private
    
    def set_user
      @user = User.find_by(params[:user_id])
    end

    def find_booking
        @booking_details = BookingDetails.find(params[:id])
      end

    def booking_detail_params
        params.permit(:date, :huber, :time_slote, :seating)
    end
  end 
end 