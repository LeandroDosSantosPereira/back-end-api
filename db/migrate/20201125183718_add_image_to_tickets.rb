class AddImageToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :image, :string
  end
end
