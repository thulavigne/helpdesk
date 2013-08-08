class Reply < ActiveRecord::Base
  attr_accessible :body
  belongs_to :ticket
end
