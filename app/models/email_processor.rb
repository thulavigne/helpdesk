class EmailProcessor
  def self.process(email)
    Reply.create!({ body: email.body })
  end
end
