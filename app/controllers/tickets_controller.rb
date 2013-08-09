class TicketsController < ApplicationController
  before_filter :find_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(params[:ticket])
    if @ticket.save
      AdminTicket.new_ticket(@ticket).deliver
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  private
  def find_ticket
    @ticket = Ticket.find(params[:id])
  end
end
