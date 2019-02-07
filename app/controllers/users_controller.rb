class UsersController < ApplicationController

	def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], password: params[:password],age: params[:age],
  		email: params[:email], city_id: City.all.sample.id)
   	
    if @user.save
    	session[:user_id] = @user.id
      flash[:notice] = "Vous avez crée votre profil utilisateur avec succès"
      redirect_to root_path
    else
    	puts "*"*100
      puts @user.errors.messages
      puts @user
      puts "*"*100 
      render "new"
    end
	end
end
