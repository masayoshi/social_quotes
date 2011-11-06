class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  validates :username,:presence => true

  has_many :quotes, :dependent => :destroy
  has_many :services, :dependent => :destroy

  
  def apply_omniauth(omniauth)
    case omniauth['provider']
    when "twitter"
      email = ''    # Twitter API never returns the email address
      omniauth['user_info']['nickname'] ? uname =  omniauth['user_info']['nickname'] : uname = ''
    when "facebook"
      omniauth['extra']['user_hash']['email'] ? email =  omniauth['extra']['user_hash']['email'] : email = ''
      omniauth['extra']['user_hash']['name'] ? uname =  omniauth['extra']['user_hash']['name'] : uname = ''
    end
    self.email = email if self.email.blank?
    self.username = uname if self.username.blank?
    self.skip_confirmation!
    connect_service(omniauth)
  end
  
  def connect_service(omniauth)
    case omniauth['provider']
    when "twitter"
      omniauth['uid'] ?  uid =  omniauth['uid'] : uid = ''
      omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
      token = (omniauth['credentials']['token'] rescue nil)
      secret = (omniauth['credentials']['secret'] rescue nil)
    when "facebook"
      omniauth['extra']['user_hash']['id'] ?  uid =  omniauth['extra']['user_hash']['id'] : uid = ''
      omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
      token = (omniauth['credentials']['token'] rescue nil)
      secret = ''
    end
    services.build(:provider => provider,:uid => uid,:token => token, :secret => secret)
  end

  def twitter
    unless @twitter_user
      provider = self.services.find_by_provider('twitter')
      @twitter_user = Twitter::Client.new(:oauth_token => provider.token, :oauth_token_secret => provider.secret) rescue nil
    end
    @twitter_user
  end

  def facebook
    @fb_user ||= FbGraph::User.me(self.services.find_by_provider('facebook').token)
  end
  
  def password_required?  
    (services.empty? || !password.blank?) && super  
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  username               :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

