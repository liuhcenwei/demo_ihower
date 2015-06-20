class AddEventUserToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :event, :integer
    add_column :memberships, :user, :interger
  end
end
