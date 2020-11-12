class AddAdsIdToTicket < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :ads_id, :integer
  end
end
