class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :generate_password, :on => :create

 def generate_password
    o =  [('a'..'z'), ('A'..'Z'), (0..9)].map{|i| i.to_a}.flatten
    self.password = self.password_confirmation = (0..16).map{ o[rand(o.length)] }.join if     self.password.blank?
  end

 after_validation :send_welcome, :on => :create

 def send_welcome
    number = self.phone
    account_sid = ENV["TWILIO_ACCOUNT_SID"] 
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create ({:to => "+1"+"#{number}",
                                                  :from => "+19143686886",
                                                  :body => "Hey, it's Votum. Thanks for signing up! Add us to your contacts so you recognize us next time we text you. P.S. If you ever need to unsubscribe just text STOP."})

  rescue Twilio::REST::RequestError => e
    puts e.message
	end

end
