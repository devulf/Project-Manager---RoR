class Status < ActiveRecord::Base
  has_many :tickets

  attr_accessible :status_id, :status_name
end
