class GossipsController < ApplicationController

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

  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user_id: 2)
    if @gossip.save
      flash[:notice] = "Vous avez crée un potin avec succès"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

	def update
	  @gossip = Gossip.find(params[:id])
	  gossip_params = params.permit(:title, :content)
	  if @gossip.update(gossip_params)
	    redirect_to @gossip
	  else
	    render :edit
	  end
	end

end