class SessionsController < ApplicationController
    def create
        auth = request.env["omniauth.auth"]
        session[:omniauth] = auth.except('extra')
        user = User.find_by(provider: auth["provider"], uid: auth["uid"]) ||   User.create_with_omniauth(auth)
        #user = Moviegoer.find_by(provider: auth["provider"], uid: auth["uid"]) ||   Moviegoer.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to movies_path ,notice: "SIGHED IN"
      end
      def destroy
        session[:user_id] = nil
        session[:omniauth] = nil 
        #flash[:notice] = 'Logged out successfully.'
        redirect_to movies_path ,notice: "SIGNED OUT"
      end
end
