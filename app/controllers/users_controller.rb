class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end
    
    def create
        @user = User.new(params[:user])

        if @user.save #If it saves properly
            redirect_to @user #Go to User show page: localhost:3000/users/#of
            #user
        else
            render :new #Otherwise render the new template with some error
            #messages
        end
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update_attributes(params[:user])
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to @user #user_path will do the same this as @user
    end
end
