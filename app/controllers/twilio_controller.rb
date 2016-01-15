class TwilioController < ApplicationController

	def first_sms
		message = params[:message]
    number = params[:number]
    account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create ({:to => "+1"+"#{number}",
                                                  :from => "+19143686886",
                                                  :body => "#{message}"})
    redirect_to '/'
	end
end
