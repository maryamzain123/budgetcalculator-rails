class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show 
        @user_total =  current_user.entries.map {|ent| ent.amount}.sum
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

    def edit
    end

    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def find_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit( :username, :email, :password)
    end

end
