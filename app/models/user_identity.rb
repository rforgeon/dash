class UserIdentity < ApplicationRecord
  belongs_to :profile

  def self.find_with_omniauth(auth)
    find_by(
    uid: auth['uid'],
    provider: auth['provider'],
    )
  end

  def self.create_with_omniauth(auth)
    create(
    user_id: current_profile.id,
    uid: auth['uid'],
    provider: auth['provider'],
    token: auth['credentials']['token'],
    refresh_token: auth['credentials']['refresh_token'],
    expires_at: auth['credentials']['expires_at']
    )
  end

end
