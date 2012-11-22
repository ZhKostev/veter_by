class Notification < ActiveRecord::Base
  CONDITIONS = {:min_power => "Min Power",
                :is_off => 'Is Off',
                :has_error => 'Has Error'
  }
  belongs_to :wind_generator
  attr_accessible :condition, :email, :level
  validates :condition, :email, :presence => true
  validates :condition, :inclusion => {:in => CONDITIONS.map{|k,v| k.to_s}}
  validates :level, :presence => true, :if => Proc.new{|n| n.condition == 'min_power'}
  validates :level, :numericality => {:greater_than_or_equal_to => 0}, :if => Proc.new{|n| n.condition == 'min_power'}
  validates :email, :format => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
end
