class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user || !@user.authenticate(params[:user][:password])
            return head(:forbidden) 
        else
         session[:user_id] = @user.id
        redirect_to "application#hello"
    end 
end
end 