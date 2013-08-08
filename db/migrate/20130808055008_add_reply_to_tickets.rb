class AddReplyToTickets < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :body
      t.integer :ticket_id

      t.timestamps
    end
  end
end
