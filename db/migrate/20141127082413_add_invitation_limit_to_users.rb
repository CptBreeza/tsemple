class AddInvitationLimitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitation_limit, :integer
  end
end
