class RemoveEventUserFromMembership < ActiveRecord::Migration
  def change
    remove_column :memberships, :event
    remove_column :memberships, :user
  end
end
