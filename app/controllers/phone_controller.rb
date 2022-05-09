class PhoneController < ApplicationController

    def index
        @phones = Phone.all

        # json_response({success: true, message: "This sare all the phone numbers!", numbers: @phones})
        json_response(@phones)
    end

    def create
        if params[:number]
            @phone = params[:number]
            @number = Phone.new(number: @phone)
            if @number.save
                json_response({success: true, message: "Your New number is created", number: @phone}) 
            else
                json_response({success: false, message: "Sometyhing went wrong Try again"}, :unprocessable_entity)
            end
        else
            @phone = 10.times.map{rand(1...9)}.join
            while Phone.exists?(number: @phone)
                @phone = 10.times.map{rand(1...9)}.join
            end
            @number = Phone.new(number: @phone)
            if @number.save
                json_response({success: true, message: "Your New number is created", number: @phone}) 
            else
                json_response({success: false, message: "Sometyhing went wrong Try again"}, :unprocessable_entity)
            end
        end
    end

end
