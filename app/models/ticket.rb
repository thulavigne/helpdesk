class Ticket < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :replies
end
