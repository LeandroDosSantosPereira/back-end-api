class AddTextToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :text, :string
  end
end
