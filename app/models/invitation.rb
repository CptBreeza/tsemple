class Invitation < ActiveRecord::Base
  validates :code, uniqueness: true

  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  before_create :generate_code

  private

  def generate_code
    begin
      self.code = SecureRandom.urlsafe_base64
    end while self.class.where(code: self.code).any?
  end

end
