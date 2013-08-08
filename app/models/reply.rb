class Reply < ActiveRecord::Base
  attr_accessible :body, :ticket_id
  belongs_to :ticket
end
