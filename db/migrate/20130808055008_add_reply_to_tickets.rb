class AddReplyToTickets < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.belongs_to :ticket

      t.timestamps
    end
    add_index :replies, :ticket_id
  end
end
