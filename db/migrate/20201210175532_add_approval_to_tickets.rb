class AddApprovalToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :approval, :boolean
  end
end
