class SessionsController < ApplicationController


    def new  
    end

    def create
    
        @user = User.find_by(username: params[:username])
        if  @user && @user.authenticate(params[:password])
              session[:user_id] = @user.id
             
            redirect_to user_entries_path(@user)
        else
            redirect_to login_path        
        end
    
    end
      
    
      def login
      end

      def destroy
          session.clear
          redirect_to login_path
      end

    def omniauth  #log users in with omniauth
        user = User.create_from_omniauth(auth)
       
        if user.valid?

            session[:user_id] = user.id
            redirect_to user_entries_path(user)
        else
            
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to login_path
        end
    end
     

      private
      def auth
          request.env["omniauth.auth"]
      end
end


