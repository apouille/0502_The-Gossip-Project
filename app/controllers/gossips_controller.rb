class GossipsController < ApplicationController

  def index
    @gossip_all= Gossip.all
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

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

end