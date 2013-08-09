class TicketMailer < ActionMailer::Base
  default from: "f617e8347a855d547748@cloudmailin.net"

  def new_ticket_notification(ticket)
    @ticket = ticket
    mail to: ENV['AGENT_ADDRESS'], subject: "New Ticket: #{@ticket.title} ID: #{@ticket.id}"
  end

end
