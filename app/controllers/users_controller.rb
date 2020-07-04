class UsersController < ApplicationController

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params(:name, :password, :email, :username))
        render_or_redirect(:new)
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def edit
        @user = User.find_by(id: params[:id])
      end
    
      def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params(:username, :name, :password, :email))
        render_or_redirect(:edit)
      end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end

    def render_or_redirect(page)
        if @user.save
            redirect_to user_path(@user)
          else
            render page
          end
    end

end
