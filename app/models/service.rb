class Service < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid, :token, :secret
end
# == Schema Information
#
# Table name: services
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  token      :string(255)
#  secret     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

