class Account < ActiveRecord::Base
  devise :database_authenticatable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  scope :with_email, lambda{|email| where(:email => email)}
end
