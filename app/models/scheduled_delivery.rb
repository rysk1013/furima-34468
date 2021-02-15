class ScheduledDelivery < ActiveHash::Base


  include ActiveHash::Association
  has_many :items
end