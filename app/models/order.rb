class Order < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :message
end
