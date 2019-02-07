class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :destroy]

  def index
    @gossip_all= Gossip.all
  end

  
  def show
  	@gossip = Gossip.find(params[:id])
  end
#/ exo 2.2.1 Hot Gossip 
#/ on attribue un numéro à chaque instance de Gossip

  def new 
  	@gossip = Gossip.new
  end

  def edit
  	@gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
    else
      flash[:notice] = "Vous n'êtes pas l'auteur du gossip"
      flash[:type] = "danger"
      redirect_to root_path
    end
  end

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content])
    @gossip.user = current_user
    if @gossip.save
      flash[:notice] = "#{current_user.first_name} a crée un potin avec succès"
      redirect_to root_path
    else
      render "new"
    end
end

	def update
	  @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
	  gossip_params = params.permit(:title, :content)
	   if @gossip.update(gossip_params)
	    redirect_to @gossip
  	  else
  	    render :edit
  	  end
    else
    flash[:notice] = "Vous n'êtes pas l'auteur du gossip"
    flash[:type] = "danger"
    redirect_to root_path
  end
end

	def destroy
		@gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
    flash[:notice] = "Vous avez supprimé un potin avec succès"
    # else
		redirect_to root_path
    else
    flash[:notice] = "Vous n'êtes pas l'auteur du gossip"
    flash[:type] = "danger"
    redirect_to root_path
  end
	end


private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end