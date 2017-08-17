class User < ApplicationRecord

  def self.find_or_create_with_omniauth(auth)
    user = where(uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.full_name = auth.info.full_name
      user.access_token = auth.credentials.token
      user.save!
    end

    user
  end

end
