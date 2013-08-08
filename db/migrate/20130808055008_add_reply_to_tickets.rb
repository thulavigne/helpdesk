class AddReplyToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :reply, :text
  end
end
