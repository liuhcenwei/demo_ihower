class RemoveEventidUseridFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :event_id
    remove_column :memberships, :user_id
  end
end
