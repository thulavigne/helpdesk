class TicketMailer < ActionMailer::Base
  default from: "f617e8347a855d547748@cloudmailin.net"

  def new_ticket_notification(ticket)
    @ticket = ticket

    @url  = 'http://example.com/login'
    mail(to: ENV['SENDGRID_USERNAME'], subject: "New Ticket: #{@ticket.title} ID: #{@ticket.id}")
  end
end
