class TwilioController < ApplicationController

   # First welcome message
  def send_welcome
    phone = params[:phone]

    @twilio_number = ENV['+19143686886']
    @client = Twilio::REST::Client.new ENV['AC8eda95c14c5d1268b1612899934c1bae'], ENV['3c071bb7c8aba72790ea9568ca57d60a']
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone,
      :body => "Welcome to Votum!"
    )
    puts message.to
  end

	def send_sms
		message = params[:message]
    number = params[:number]
    account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create ({:to => "+1"+"#{number}",
                                                  :from => "+19143686886",
                                                  :body => "#{message}"})
    redirect_to '/admin/dashboard'
	end

  def create

  end


end
