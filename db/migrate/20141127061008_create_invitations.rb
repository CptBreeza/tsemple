class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :code, index: true
      t.belongs_to :invitee
      t.boolean :available, default: true
      t.belongs_to :inviter, index: true

      t.timestamps
    end
  end
end
