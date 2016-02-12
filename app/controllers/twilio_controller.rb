class TwilioController < ApplicationController

Dotenv.load

# Send to individual number on dashboard
	def send_sms
		message = params[:message]
    number = params[:number]
    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    #account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    #auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create ({:to => "+1"+"#{number}",
                                                  :from => "+19143686886",
                                                  :body => "#{message}"})
    redirect_to '/admin/dashboard', :flash => { :success => "Your message sent!" }

  rescue Twilio::REST::RequestError => e
    puts e.message
	end


# Send message to all users on dashboard
  def send_sms_all
    user_phones = User.where(:subscribed => true).pluck(:phone)
    message = params[:message]
    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
   #account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
    #auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    user_phones.each do |number|
      @client.account.messages.create ({:to => "+1"+"#{number}",
                                        :from => "+19143686886",
                                        :body => "#{message}"})
    end
   redirect_to '/admin/dashboard', :flash => { :success => "Your message sent!" }

   rescue Twilio::REST::RequestError => e
    puts e.message
  end

# Lists responses 

def list_responses

   account_sid = 'AC8eda95c14c5d1268b1612899934c1bae'
   auth_token = '3c071bb7c8aba72790ea9568ca57d60a'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.list({ }).each do |message| 
      puts message.body 
    end

end


# Respond to messages sent in
  def responses
   @from = params[:From]
   u = User.find_by_phone(@from)
   b = params[:Body]

   if b.downcase.include?("yes")
    @type = "Yes"
    # @yes = u.yes.build(:description => b)
    # @yes.save!
    render 'voted.xml.erb', :content_type => 'text/xml'
  
   elsif b.downcase.include?("no")
    @type = "No"
    # @no = u.nos.build(:description => b)
    # @no.save!
    render 'voted.xml.erb', :content_type => 'text/xml'
   
   else 
    @type = "Other"
    # @other = u.others.build(:description => b)
    # @other.save!
    render 'general.xml.erb', :content_type => 'text/xml'
   end

  #head :ok
  end


end
