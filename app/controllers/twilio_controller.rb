class TwilioController < ApplicationController


# Send to individual number on dashboard
	def send_sms
		message = params[:message]
    number = params[:number]
    account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create ({:to => "+1"+"#{number}",
                                                  :from => "+19143686886",
                                                  :body => "#{message}"})
    redirect_to '/admin/dashboard', :flash => { :success => "Your message sent!" }
	end


# Send message to all users on dashboard
def send_sms_all
    user_phones = User.where(:subscribed => true).pluck(:phone)
    message = params[:message]
    account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    user_phones.each do |number|
      @client.account.messages.create ({:to => "+1"+"#{number}",
                                        :from => "+19143686886",
                                        :body => "#{message}"})
    end
   redirect_to '/admin/dashboard', :flash => { :success => "Your message sent!" }
  end


  def create

  end


end
