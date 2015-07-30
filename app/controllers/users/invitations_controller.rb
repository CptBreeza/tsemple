class Users::InvitationsController < Users::ApplicationController
  before_action :login_required, only: [:index, :create]

  def index
    @invitation = Invitation.new
    @invitations = @user.invitations.where(available: true).order(:id)
    @invitations_used = @user.invitations.where(available: false).order(:id)
  end

  def create
    @invitation = current_user.generate_invitation
  end

  def show
    @invitation_code = params[:invitation_code]
    @invitation = Invitation.find_by(code: @invitation_code)
  end
end
