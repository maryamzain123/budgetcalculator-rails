class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show 
        if (params[:id]).to_i == current_user.id
        @user_total =  current_user.entries.map {|ent| ent.amount}.sum
        else
            redirect_to "/"
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save  
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end


  

    private

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit( :username, :email, :password)
    end

end
