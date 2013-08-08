class RepliesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :find_reply, except: [:create]

  def create
    @reply = Reply.new
    @reply.body = params[:plain]
    @reply.ticket_id = get_ticket_id(params[:headers][:Subject])
    @reply.save
    render text: 'success', status: 200
  end

  def edit
  end

  def update
    if @reply.update_attributes(params[:reply])
      flash[:notice] = "Your reply has been updated."
      redirect_to ticket_path(@reply.ticket_id)
    else
      flash[:alert] = "Your reply has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @reply.destroy
    flash[:notice] = "Your reply has been deleted."
    redirect_to ticket_path(@reply.ticket_id)
  end

  private
  def get_ticket_id(param)
    param.scan(/\d/)[0]
  end

  def find_reply
    @reply = Reply.find(params[:id])
  end
end
