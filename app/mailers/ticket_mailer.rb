class TicketMailer < ActionMailer::Base
  default from: "f617e8347a855d547748@cloudmailin.net"

  def new_ticket_notification(ticket)
    @ticket = ticket

    headers["ticket_id"] = @ticket.id
    mail to: ENV['GMAIL_USERNAME'], subject: "New Ticket: #{@ticket.title} ID: #{@ticket.id}"
  end
end
