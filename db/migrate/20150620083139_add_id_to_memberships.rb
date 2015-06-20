class AddIdToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :event_id, :integer
    add_column :memberships, :user_id, :integer
  end
end
