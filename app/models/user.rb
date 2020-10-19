class User < ApplicationRecord
    def sign_in_from_omniauth(auth)
        find_by(provider: auth["provider"], uid: auth["uid"]) ||   create_with_omniauth(auth)
    end
    def self.create_with_omniauth(auth)
        User.create!(
          :provider => auth["provider"],
          :uid => auth["uid"],
          :name => auth["info"]["name"])
    end
end
