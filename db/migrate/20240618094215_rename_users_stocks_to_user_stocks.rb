class RenameUsersStocksToUserStocks < ActiveRecord::Migration[7.1]
  def change
    rename_table :friends, :friendships
  end
end
